#!/bin/bash

# This script is useful for CI/CD where it will only build that packages which are changed
# Get the project root directory (to remove absolute paths from package paths)
project_root=$(git rev-parse --show-toplevel)

# Step 1: Define the commit ID (you can pass this as an argument to the script or get the latest commit)
commit_id=${1:-$(git rev-parse HEAD)}  # Default to the latest commit if no commit ID is provided

# Step 2: Get a list of all files changed in the specific commit (relative to the project root)
changed_files=$(git diff --name-only $commit_id~1 $commit_id)

# Step 3: Detect the packages with changed files
changed_packages=()

# Get the root paths of all packages in the workspace
package_paths=$(melos list --parsable | cut -d'|' -f1)

# Loop through each package path
for package_path in $package_paths; do
  # Convert the full package path to a relative path
  relative_package_path="${package_path#$project_root/}"

  # Replace '-' with '_' in the package name
  package_name=$(basename "$relative_package_path" | sed 's/-/_/g')

  # Check if any changed file is within the package directory
  if echo "$changed_files" | grep -q "^$relative_package_path/"; then
    changed_packages+=("$package_name")
  fi
done

# Step 4: Run the melos command for the detected packages
if [ ${#changed_packages[@]} -eq 0 ]; then
  echo "No changed packages detected."
else
  # Create a comma-separated list of package names
  changed_packages_list=$(IFS=,; echo "${changed_packages[*]}")
  echo "Running melos for the following packages: $changed_packages_list"
  
  # Execute the melos command for the detected packages
  melos exec --scope=$changed_packages_list -- flutter pub run build_runner build --delete-conflicting-outputs
fi


