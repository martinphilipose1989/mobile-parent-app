import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_document_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryDocumentEntity extends BaseLayerDataTransformer<EnquiryDocumentEntity, EnquiryDocument>{
    @JsonKey(name: 'document_id')
    int? documentId;
    @JsonKey(name: 'document_name')
    String? documentName;
    @JsonKey(name: 'file')
    String? file;
    @JsonKey(name: 'is_verified')
    bool? isVerified;
    @JsonKey(name: 'is_deleted')
    bool? isDeleted;
    @JsonKey(name:'stage')
    String? stage;
    @JsonKey(name:'is_mandatory')
    int? isMandatory;

    EnquiryDocumentEntity({
        this.documentId,
        this.documentName,
        this.file,
        this.isVerified,
        this.isDeleted,
        this.stage,
        this.isMandatory,
    });

  factory EnquiryDocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryDocumentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryDocumentEntityToJson(this);

  @override
  EnquiryDocument transform() {
    EnquiryDocument enquiryDocument = EnquiryDocument();
    enquiryDocument.documentId = documentId;
    enquiryDocument.documentName = documentName;
    enquiryDocument.file = file;
    enquiryDocument.isVerified = isVerified;
    enquiryDocument.isDeleted = isDeleted;
    enquiryDocument.isMandatory = isMandatory;
    enquiryDocument.stage = stage;
    return enquiryDocument;
  }

}