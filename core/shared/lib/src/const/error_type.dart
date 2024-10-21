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

  //ATTACHMENT ERROR
  fileSizeExceed,
  filePickerFailed,
  imagePickerFailed,
  imagePickerCancelled,
  uiInvalidAmount,

  // Auth Error
  appAuthUserCancelled,
  appAuthPlatformException,

  // Storage
  storageError
}
