import os

def rename_folders(directory):
    # Loop through all items in the specified directory and its subdirectories
    for root, dirs, files in os.walk(directory):
        for folder_name in dirs:
            # Create the full path for the current folder
            folder_path = os.path.join(root, folder_name)
            # Replace hyphens with underscores
            new_folder_name = folder_name.replace('-', '_')
            new_folder_path = os.path.join(root, new_folder_name)

            # Rename the folder if the name has changed
            if new_folder_name != folder_name:
                os.rename(folder_path, new_folder_path)
                print(f'Renamed: "{folder_name}" to "{new_folder_name}"')

# Specify the directory you want to rename folders in
directory_to_rename = './content'

# Call the function to rename folders
rename_folders(directory_to_rename)
