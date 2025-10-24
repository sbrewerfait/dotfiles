#!/Users/sbrewer/.config/scripts/daily_note/.venv/bin/python

import os
import pandas as pd
from datetime import datetime

# --- CONFIGURE THIS ---
ROOT_FOLDER = '/Users/sbrewer/Library/Mobile Documents/iCloud~md~obsidian/Documents/SBrewer Dev/SBrewer Dev/01 - Daily/'
# ----------------------

# Get today's date
now = datetime.now()

# Get current year
year = now.strftime('%Y')

# Get number of quarter
quarter = pd.Timestamp.now().quarter
print(f"Quarter: {quarter}")

# Month abbreviation
month_abbr = now.strftime('%b')  # e.g., 'Jul'

# Calculate week of month
first_day = now.replace(day=1)
dom = now.day
adjusted_dom = dom + first_day.weekday()  # weekday(): Mon=0, Sun=6

week_of_month = int((adjusted_dom - 1) / 7) + 1  # 1-based index

# Directory path: ROOT/MonthAbbr/WeekOfMonth/
dir_path = os.path.join(
    ROOT_FOLDER,
    year,
    month_abbr,
    f"Week {week_of_month}"
)

os.makedirs(dir_path, exist_ok=True)

# File name: mm-dd-yyyy.md
filename = now.strftime('%m-%d-%Y.md')
file_path = os.path.join(dir_path, filename)

# Create the file if not exists, or append a header if you wish
if not os.path.exists(file_path):
    with open(file_path, 'w') as f:
        pass # create an empty file

print(f"Created or found: {file_path}")
