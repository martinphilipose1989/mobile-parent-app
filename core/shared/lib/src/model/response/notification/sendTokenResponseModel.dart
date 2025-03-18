class SendTokenResponseModel {
 TokenDataModel? tokenDataModel;

  SendTokenResponseModel({
    this.tokenDataModel,
  });

}

class TokenDataModel {
  int? id;
  Attribute? attributes;

 TokenDataModel({
    this.id,
    this.attributes,
  });

}

class Attribute {
  String? appToken;

  Attribute({
    this.appToken,
  });

}
