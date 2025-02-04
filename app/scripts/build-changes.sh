#!/bin/bash

# Get the project root directory (to remove absolute paths from package paths)
project_root=$(git rev-parse --show-toplevel)

# Step 1: Get a list of all unstaged files (relative to the project root)
unstaged_files=$(git diff --name-only)

# Step 2: Detect the packages with changed files
changed_packages=()

# Get the root paths of all packages in the workspace
package_paths=$(melos list  --parsable | cut -d'|' -f1)

# Loop through each package path
for package_path in $package_paths; do
  # Convert the full package path to a relative path
  relative_package_path="${package_path#$project_root/}"

  # Replace '-' with '_' in the package name
  package_name=$(basename "$relative_package_path" | sed 's/-/_/g')

  # Check if any unstaged file is within the package directory
  if echo "$unstaged_files" | grep -q "^$relative_package_path/"; then
    changed_packages+=("$package_name")
  fi
done

# Step 3: Run the melos command for the detected packages
if [ ${#changed_packages[@]} -eq 0 ]; then
  echo "No changed packages detected."
else
  # Filter out 'shared' package from the changed packages list
  filtered_packages=()
  for package in "${changed_packages[@]}"; do
    if [[ "$package" != "shared" ]]; then
      filtered_packages+=("$package")
    fi
  done

  # Check if there are any packages left after filtering
  if [ ${#filtered_packages[@]} -eq 0 ]; then
    echo "No relevant packages to run melos on after filtering."
  else
    # Create a comma-separated list of package names
    changed_packages_list=$(IFS=,; echo "${filtered_packages[*]}")
    echo "Running melos for the following packages: $changed_packages_list"

    # Execute the melos command for the filtered packages
    melos exec --scope=$changed_packages_list -- flutter pub run build_runner build --delete-conflicting-outputs
  fi
fi

