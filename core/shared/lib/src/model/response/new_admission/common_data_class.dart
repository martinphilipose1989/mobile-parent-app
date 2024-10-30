class CommonDataClass{
  int? id;
  String? value;

  CommonDataClass(
    {this.id,
    this.value}
  );
}

extension CommonDataClassExtension on CommonDataClass {
  bool isValid() {
    return this.id != null && this.value != null && (this.value??'').isNotEmpty;
  }
}