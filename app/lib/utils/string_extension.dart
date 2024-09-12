// extension on String
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }

  bool isEmptyOrNull() {
    return (this??"").isEmpty || this == null || (this??'').contains('N/A');
  }
}
