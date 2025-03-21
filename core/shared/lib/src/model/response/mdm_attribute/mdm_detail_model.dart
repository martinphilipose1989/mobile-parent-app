import 'package:shared/src/model/response/mdm_attribute/attribute_model.dart';

class MdmAttributeModel {
  int? id;
  AttributesDetailsModel? attributes;

  MdmAttributeModel({this.id, this.attributes});

  @override
  String toString() {
    return 'MdmAttributeModel('
        'id: $id, '
        'attributes: ${attributes.toString()}'
        ')';
  }
}
