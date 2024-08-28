import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'existing_school_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ExistingSchoolDetailsEntity extends BaseLayerDataTransformer<ExistingSchoolDetailsEntity,ExistingSchoolDetails>{
    @JsonKey(name: 'name')
    String? name;
    @JsonKey(name: 'board')
    CommonDataEntity? board;
    @JsonKey(name: 'grade')
    CommonDataEntity? grade;

    ExistingSchoolDetailsEntity({
        this.name,
        this.board,
        this.grade,
    });

  factory ExistingSchoolDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ExistingSchoolDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ExistingSchoolDetailsEntityToJson(this);
  
  @override
  ExistingSchoolDetails transform() {
    ExistingSchoolDetails existingSchoolDetails = ExistingSchoolDetails();
    existingSchoolDetails.board = board?.transform();
    existingSchoolDetails.grade = grade?.transform();
    existingSchoolDetails.name = name??'';
    return existingSchoolDetails;
  }

  @override
  ExistingSchoolDetailsEntity restore(ExistingSchoolDetails data) {
    CommonDataEntity commonDataEntity = CommonDataEntity();
    ExistingSchoolDetailsEntity existingSchoolDetailsEntity = ExistingSchoolDetailsEntity(
      board : commonDataEntity.restore(data.board!),
      grade : commonDataEntity.restore(data.grade!),
      name : data.name??'',
    );
    return existingSchoolDetailsEntity;
  }
}