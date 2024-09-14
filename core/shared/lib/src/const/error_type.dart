enum ErrorType {
  //custom error
  iOException,

  //Network Error
  network,
  netServerMessage,
  netDefaultError,
  unknown,
  // UI Errors
  ui,
  uiEmptyEmail,
  uiInvalidEmail,
  uiEmptyPassword,
  uiEmptyField,

  //DB ERROR
  database,
  databaseNotSupported,
  databaseError1,
  databaseUserNotFound,

  imagePickerCancelled,
  imagePickerFailed,
  fileSizeExceed,
  filePickerFailed,

  // Auth Error
  appAuthUserCancelled,
  appAuthPlatformException,

  // Storage
  storageError
}
