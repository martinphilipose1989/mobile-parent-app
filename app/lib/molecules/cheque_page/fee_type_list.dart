import 'package:app/molecules/cheque_page/cheque_fee_type_dropdown.dart';

class FeeTypeList implements DropDownValues {
  final int id;
  final String name;
  bool selected;

  FeeTypeList(
      {required this.id,
      required this.name,
      this.selected = false,
      this.selectedId = -1});

  @override
  String getTitle() => name;

  @override
  int getId() => id;

  @override
  bool isSelected() => selected;

  @override
  int selectedId;
}
