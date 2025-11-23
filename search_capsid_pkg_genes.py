import os
import csv
import re

# Load the capsid and pkg lists into sets
def load_list(file_path):
    with open(file_path, 'r') as f:
        return set(line.strip().lower() for line in f if line.strip())

capsid_set = load_list('uniprotkb_capsid_list.txt')
pkg_set = load_list('uniprotkb_pkg_list.txt')

csv_directory = './'
output_rows = []
max_columns = 0  # Track maximum columns seen

# Build regex patterns for full word matching (case-insensitive)
capsid_pattern = re.compile(r'\b(?:' + '|'.join(re.escape(item) for item in capsid_set) + r')\b', re.IGNORECASE)
pkg_pattern = re.compile(r'\b(?:' + '|'.join(re.escape(item) for item in pkg_set) + r')\b', re.IGNORECASE)

print("\n🔎 Starting CSV scan...")

for filename in os.listdir(csv_directory):
    if filename.endswith('.csv') and filename != 'search_script_virus.csv':
        capsid_lines = []
        pkg_lines = []
        filepath = os.path.join(csv_directory, filename)
        
        with open(filepath, newline='') as csvfile:
            reader = csv.reader(csvfile)
            next(reader, None)  # Skip header if exists
            for row in reader:
                row_joined = ' '.join(cell.strip().lower() for cell in row)

                if capsid_pattern.search(row_joined):
                    capsid_lines.append(row)
                if pkg_pattern.search(row_joined):
                    pkg_lines.append(row)

                # Track max columns
                if len(row) > max_columns:
                    max_columns = len(row)

        # Mini report for each file
        if capsid_lines and pkg_lines:
            print(f"📄 {filename} → {len(capsid_lines)} Capsid matches, {len(pkg_lines)} PKG matches ✅")
            for line in capsid_lines:
                output_rows.append(line + ['Capsid', filename])
            for line in pkg_lines:
                output_rows.append(line + ['PKG', filename])
        else:
            print(f"📄 {filename} → No matching Capsid/PKG pair ❌")

# Final write
report_path = os.path.join(csv_directory, 'search_script_virus.csv')

with open(report_path, 'w', newline='') as f:
    writer = csv.writer(f)

    header = [f'Original Column {i+1}' for i in range(max_columns)] + ['Match Type', 'File Name']
    writer.writerow(header)
    
    writer.writerows(output_rows)

print(f'\n✅ Flexible clean CSV saved to: {report_path}')
