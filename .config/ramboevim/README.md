# Neovim + C# in 2025: The Actually Improved Setup | roslyn.nvim + rzsl.nvim (from scratch)

## Prerequisites (for VS Code / Rider / Visual Studio users)  

Before you start, you should have:  

### 1) Installed software (Arch Linux)  
  - **Neovim ≥ 0.11.0**  
  - **.NET SDK (9.0+)** → `pacman -S dotnet-sdk`  
  - **Git, GCC, ripgrep, fzf, unzip, curl, wget, npm** → `pacman -S git gcc ripgrep fzf unzip curl wget npm`  
  - **NVChad** (we install it in the tutorial)  
  - **Optional:** Docker (if you want to run the demo container)  

### 2) Neovim basics (VS Code mapping)  
  - **Modal editing:** _Normal_ (navigate/commands), _Insert_ (typing), _Visual_ (select).  
    - Enter insert: `i` • Back to normal: `Esc`  
  - **Save/Quit:** `:w` (save), `:q` (quit), `:wq` (save & quit)  
  - **Files & panes:** `:e <file>` (open), splits/tabs (like VS Code editor groups/tabs)  
  - **Help:** `:help` (built-in docs), `:checkhealth` (diagnostics)  
  - **Leader key:** usually `<leader>` = `Space` in NVChad (used for custom mappings), [NvChad default mappings](https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua)

### 3) Plugin & tooling concepts you’ll see  
  - **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** modern syntax highlighting/AST.
  - **[Mason](https://github.com/mason-org/mason.nvim):** installs external tools (LSPs, debuggers, formatters). `:Mason`, `:MasonInstall <tool>`  
  - **[Lazy (NVChad’s plugin manager)](https://github.com/folke/lazy.nvim):** `:Lazy` to sync/update.  
  - **[LSP (Language Server Protocol)](https://github.com/microsoft/language-server-protocol):** Roslyn powers IntelliSense, go-to-def, rename, code actions, hints.
  - **[DAP (Debug Adapter Protocol)](https://github.com/microsoft/debug-adapter-protocol):** `nvim-dap` for debugging (similar to VS Code’s debugger). 

### 4) .NET CLI familiarity  
  - Project basics: `.sln`, `.csproj`  
  - Commands you’ll use:  
    - `dotnet new console -n MyConsole`  
    - `dotnet new blazor -n MyBlazor`  
    - `dotnet build`  
    - `dotnet test`  
  - Knowing where build outputs go (e.g. `bin/Debug/net9.0/`)  

### 5) Razor/Blazor context (high level)  
  - Razor files (`.razor`, `.cshtml`) and “code-behind” partial classes.  

### 6) Debugging expectations  
  - We’ll use **netcoredbg** via `nvim-dap`.  
  - You should be comfortable selecting a **.dll** to launch when prompted.  

### 7) (Nice to have)  
  - Basic **Lua** reading (you’ll copy small config blocks).  
  - Comfort with environment paths (e.g. Mason tools live under `:echo $MASON`).  

## Create a Docker Image for Testing  

For the purpose of demonstration or to try out how everything works before you break your system, we can run all the upcoming commands inside a docker container. In this demo that container is based on the latest ubuntu image.  

### Create the Dockerfile  

Create a `Dockerfile` in your desired directory that looks like this:  

```shell
# Use Arch Linux as the base image
FROM archlinux:latest

# Update system and install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        sudo \
        curl \
        git \
        fzf \
        ripgrep \
        unzip \
        wget \
        npm \
        dotnet-sdk \
        gcc \
        neovim \
        && pacman -Scc --noconfirm

# Create a new user 'ramboe' with sudo privileges
RUN useradd -m -s /bin/bash ramboe && \
    echo "ramboe ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER ramboe
WORKDIR /home/ramboe

# Create common folders
RUN mkdir Downloads Documents

# Default command
CMD ["/bin/bash"]
```  

### Create the Container from the Dockerfile  

Within the same directory execute the following commands  

`docker build -t csharp-nvim-demo .`  

`docker run -it --name cnd-container csharp-nvim-demo`  

`docker exec -it cnd-container bash`  

Congratulations, you now have your arch docker environment set up and are ready go to the actually interesting part.  

## Install NvChad for neovim and C# dependencies  

For the sake of convenience we use [nvchad](https://nvchad.com/docs/quickstart/install) in this tutorial since it already comes with a lot of comfort pre-installed and uses common package managers like [Mason](https://github.com/williamboman/mason.nvim) and [LazyVim](https://www.lazyvim.org/)  

```shell
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```  

## Configure NeoVim for C#  

### Set up treesitter for syntax highlighting  

**ADD** the following lines to  `~/.config/nvim/lua/plugins/init.lua`

```lua
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hyprlang",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      
        -- !
        "c_sharp",
        "razor"
      },
    },
  },
```  

### Install the necessary executables via Mason.  

**ADD** the following lines to  `~/.config/nvim/lua/plugins/init.lua`

```lua
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        
        "xmlformatter",
        "csharpier",
        "prettier",
      
        "stylua",
        "bicep-lsp",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "typescript-language-server",
        "json-lsp",
        "rust-analyzer",

        -- !
        "roslyn",
        -- "csharp-language-server",
        -- "omnisharp",
      },
    },
  },
```  

Then, **inside neovim** execute `:MasonInstallAll`  

Since the `roslyn` executable comes from foreign registries it has to be installed explicitely with `:MasonInstall roslyn`  

### LSP for dotnet: [seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim)

**ADD** the following lines to  `~/.config/nvim/lua/plugins/init.lua`

```lua
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
},
```  

**ADD** the following lines to  `~/.config/nvim/lua/configs/lspconfig.lua`

```lua
vim.lsp.config("roslyn", {})
```  

### Test: Syntax Highlighting and roslyn.nvim LSP  

Create Test Projects  

```shell
cd ~/Documents && \
dotnet new console -n MyConsole && \
cd MyConsole && \
dotnet build
```

Then provoke syntax error to see if the LSP screams at you, navigate around with `:lua vim.lsp.buf.definition()`  

### LSP for razor (Blazor): also [seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#razorcshtml-support)

**CAUTION: rzls is [obsolete](https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#razorcshtml-support) !**

> "This plugin has recently added support for Razor/CSHTML files. This enabled razor support using co-hosting and superceeds the old rzls.nvim. If you previoulsy used rzls.nvim, please uninstall it and the rzls language server."

The `seblyng/roslyn.nvim` section inside `~/.config/nvim/lua/plugins/init.lua` therefore does not need to be touched.

**ADD** the following line to  `~/.config/nvim/lua/configs/lspconfig.lua` **above** `vim.lsp.config("roslyn", {})`

```lua
local mason_root = require("mason.settings").current.install_root_dir
```  

so it looks like this in the end:

```lua
-- ROSLYN (+razor support)
local mason_root = require("mason.settings").current.install_root_dir

vim.lsp.config("roslyn", {})
-- END ROSLYN
```  

### Test: roslyn.nvim LSP on `.razor` files  

Create Test Projects  

```shell
cd ~/Documents && \
dotnet new blazor -n MyBlazor
cd MyBlazor && \
dotnet build
```

Then provoke syntax error to see if the LSP screams at you, navigate around with `:lua vim.lsp.buf.definition()`  

## Setup NeoVim for Debugging and Unit Testing in C#  

### Put the debugger (dap) in place  

`:MasonInstall netcoredbg`  

create `nvim-dap.lua` and `nvim-dap-ui.lua`  

```shell
touch ~/.config/nvim/lua/configs/nvim-dap.lua && touch ~/.config/nvim/lua/configs/nvim-dap-ui.lua
```  

**PASTE** these lines into `~/.config/nvim/lua/configs/nvim-dap.lua`

This will configure the debugger and add the keybindings that we need while we debug our code  

```lua
local dap = require("dap")

local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

local netcoredbg_adapter = {
  type = "executable",
  command = mason_path,
  args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
dap.adapters.coreclr = netcoredbg_adapter    -- needed for unit test debugging

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
program = function()
      -- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
    end,

    -- justMyCode = false,
    -- stopAtEntry = false,
    -- -- program = function()
    -- --   -- todo: request input from ui
    -- --   return "/path/to/your.dll"
    -- -- end,
    -- env = {
    --   ASPNETCORE_ENVIRONMENT = function()
    --     -- todo: request input from ui
    --     return "Development"
    --   end,
    --   ASPNETCORE_URLS = function()
    --     -- todo: request input from ui
    --     return "http://localhost:5050"
    --   end,
    -- },
    -- cwd = function()
    --   -- todo: request input from ui
    --   return vim.fn.getcwd()
    -- end,
  },
}

local map = vim.keymap.set

local opts = { noremap = true, silent = true }

map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F6>", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
map("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
-- map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
map("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
map("n", "<leader>dt", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
  { noremap = true, silent = true, desc = 'debug nearest test' })
```

**PASTE** these lines into `~/.config/nvim/lua/configs/nvim-dap-ui.lua`

This will configure the UI while debugging.  

```lua
local dapui = require("dapui")
local dap = require("dap")

--- open ui immediately when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- default configuration
dapui.setup()
```

### Configure lua files for debugging  

**ADD** the following lines to `~/.config/nvim/lua/plugins/init.lua`

```lua
{
    -- Debug Framework
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.nvim-dap"
    end,
    event = "VeryLazy",
  },
  { "nvim-neotest/nvim-nio" },
  {
    -- UI for debugging
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },
  {
    "nvim-neotest/neotest",
    requires = {
      {
        "Issafalcon/neotest-dotnet",
      }
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
    dependencies = {
      "nvim-neotest/neotest"
    }
  },

```  

**ADD** the following lines to `~/.config/nvim/init.lua`

```lua
require("neotest").setup({
  adapters = {
    require("neotest-dotnet")
  }
})
```  

### Test: Debugging and Unit Testing  

#### Debug the Program.cs  

```shell
cd ~/Documents/MyConsole && \
nvim
```

Set breakpoint with `F9`, start debugger with `F5`  

#### Create a Test Project  

```shell
cd ~/Documents && \
dotnet new nunit -n MyTest && \
cd MyTest && \
dotnet build
```

debug a unit test with `<leader>dt`  

### [OBSOLETE] Temporay workaround until `nvim-neotest/neotest` is fixed  

> Test recognition has been fixed with the following commit: https://github.com/nvim-neotest/neotest/commit/2cf3544fb55cdd428a9a1b7154aea9c9823426e8 - you therefore can skip the "Temporary workaround" section from now

**SET** the commit property for a neotest version that recognizes untit tests in `~/.config/nvim/lua/plugins/init.lua`

```lua
{
    "nvim-neotest/neotest",
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- THIS ONE
    -- ...
  },
```

`:Lazy` > `U`  

### Improving the Debugging experience  

https://github.com/ramboe/ramboe-dotnet-utils/blob/main/lua/dap-dll-autopicker/README.md  

## De-Briefing

### latest dotnet version

- for arch see https://wiki.archlinux.org/title/.NET
- find latest version number here https://dotnet.microsoft.com/en-us/download/dotnet/9.0

### topics covered outside of this tutorial 

- [x] inline diagnostics ui - [video](https://youtu.be/GXdJqIHQ2A0)
- [x] configuring the nvim-dap-ui - [video](https://youtu.be/UCA_OqPvBrs)
- [x] formatting with conform and csharpier [video](https://www.youtube.com/watch?v=GEVkG0pTjwc)
- [ ] my personal dotnet programming workflow and the tools that enable it (ramboe-dotnet-utils, tmux, ...)
- [ ] migrating from rider/vs/vscode to nvim - a practical guide
