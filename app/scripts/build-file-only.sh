#!/bin/bash

# Get the project root directory (to remove absolute paths from package paths)
project_root=$(git rev-parse --show-toplevel)

# Step 1: Define the commit ID (you can pass this as an argument to the script or get the latest commit)
commit_id=${1:-$(git rev-parse HEAD)}  # Default to the latest commit if no commit ID is provided

# Step 2: Get a list of all files changed in the specific commit (relative to the project root)
changed_files=$(git diff --name-only $commit_id~1 $commit_id)

# Step 3: Loop through each package in the workspace
package_paths=$(melos list --parsable | cut -d'|' -f1)

# Initialize an empty array to track the packages with changes and their respective files
changed_packages=()

# Loop through each package path
for package_path in $package_paths; do
  # Convert the full package path to a relative path
  relative_package_path="${package_path#$project_root/}"

  # Replace '-' with '_' in the package name
  package_name=$(basename "$relative_package_path" | sed 's/-/_/g')

  # Get the changed files for this package, but only files in the `lib` folder
  package_changed_files=()

  # Loop through each changed file and check if it belongs to the current package's `lib` folder
  for changed_file in $changed_files; do
    if [[ "$changed_file" == "$relative_package_path/lib/"* ]]; then
      package_changed_files+=("$changed_file")
    fi
  done

  # If there are changed files in the package, add the package and the files to the list
  if [ ${#package_changed_files[@]} -gt 0 ]; then
    changed_packages+=("$package_name")
    # Create a comma-separated list of the changed files in the package
    package_changed_files_list=$(IFS=,; echo "${package_changed_files[*]}")
    echo "Package: $package_name has the following changed files in 'lib': $package_changed_files_list"
    
    # Step 4: Run the melos command for the detected files in the package
    melos exec --scope=$package_name -- flutter pub run build_runner build --delete-conflicting-outputs -- $package_changed_files_list
  fi
done

# Final output message
if [ ${#changed_packages[@]} -eq 0 ]; then
  echo "No changed packages detected."
else
  echo "Finished processing changed packages."
fi
