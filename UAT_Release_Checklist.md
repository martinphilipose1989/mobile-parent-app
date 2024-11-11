
### UAT/Release Checklist

1. **Disable Alice Logger**
   - Comment out or disable all instances of Alice Logger to prevent logging in production.

2. **Run Melos**
   - In the project directory, run the command:
     ```bash
     melos run
     ```

3. **Choose Melos Option 1**
   - When prompted, select **Option 1** to complete the initial setup.

4. **Run Additional Melos Options**
   - After completing Step 2:
     - Select **Option 5** and follow the instructions.
     - Then, select **Option 4** and follow the instructions.

5. **Navigate to the Scripts Folder**
   - Go to the `app/scripts` directory.

6. **Run the Build Script**
   - Execute the build script with the appropriate platform and environment settings:
     ```bash
     ./build.sh apk/ios env(dev, qa, prod)
     ```
   - Replace `apk/ios` and `env` values based on the required build (e.g., `dev`, `qa`, or `prod`).

7. **Rename the Generated File**
   - After the build completes, rename the generated `.ipa` or `.apk` file to the following format:
     ```
     appname_env_YYYYMMDD_BuildNo
     ```
   - **Example**: For an app named `MyApp`, built in the `prod` environment on **November 5, 2024** with build number **1**, the file name should be:
     ```
     parent_prod_20241105_1
     ```

