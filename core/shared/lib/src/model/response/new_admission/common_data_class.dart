class CommonDataClass {
  int? id;
  String? value;

  CommonDataClass({this.id, this.value});

  @override
  String toString() {
    return 'CommonDataClass(id: $id, value: $value)';
  }
}

extension CommonDataClassExtension on CommonDataClass {
  bool isValid() {
    return id != null && value != null && (value ?? '').isNotEmpty;
  }
}
