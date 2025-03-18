class CoReasonsListResponseModel {
  List<Datum> data;


  CoReasonsListResponseModel({
    required this.data,

  });

}

class Datum {
  int id;
  Attributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

}

class Attributes {
  String name;
  String slug;
  String description;
  dynamic parentId;
  dynamic statusId;
  int order;
  int isActive;
  dynamic createdAt;
  dynamic updatedAt;

  Attributes({
    required this.name,
    required this.slug,
    required this.description,
    required this.parentId,
    required this.statusId,
    required this.order,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

}







