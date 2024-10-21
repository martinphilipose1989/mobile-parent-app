import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SubjectEntity extends BaseLayerDataTransformer<SubjectEntity, Subject>{
    int? id;
    int? schoolId;
    int? schoolBrandId;
    int? subjectId;
    int? isCompulsory;
    int? isOptionalCompulsory;
    int? orderNo;
    int? academicYearId;
    int? statusId;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic createdById;
    dynamic updatedById;
    String? schoolName;
    String? subjectName;
    String? academicYear;
    String? brandName;
    String? boardName;
    String? courseName;
    String? streamName;
    String? gradeName;
    String? termName;
    dynamic optionNumber;

    SubjectEntity({
        this.id,
        this.schoolId,
        this.schoolBrandId,
        this.subjectId,
        this.isCompulsory,
        this.isOptionalCompulsory,
        this.orderNo,
        this.academicYearId,
        this.statusId,
        this.createdAt,
        this.updatedAt,
        this.createdById,
        this.updatedById,
        this.schoolName,
        this.subjectName,
        this.academicYear,
        this.brandName,
        this.boardName,
        this.courseName,
        this.streamName,
        this.gradeName,
        this.termName,
        this.optionNumber,
    });

    factory SubjectEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectEntityFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectEntityToJson(this);

  @override
  Subject transform() {
    Subject subject = Subject();
    subject.id = id;
    subject.schoolId = schoolId;
    subject.schoolBrandId = schoolBrandId;
    subject.subjectId = subjectId;
    subject.isCompulsory = isCompulsory;
    subject.isOptionalCompulsory = isOptionalCompulsory;
    subject.orderNo = orderNo;
    subject.academicYearId = academicYearId;
    subject.statusId = statusId;
    subject.createdAt = createdAt;
    subject.updatedAt = updatedAt;
    subject.createdById = createdById;
    subject.updatedById = updatedById;
    subject.schoolName = schoolName;
    subject.subjectName = subjectName;
    subject.academicYear = academicYear;
    subject.brandName = brandName;
    subject.boardName = boardName;
    subject.courseName = courseName;
    subject.streamName = streamName;
    subject.gradeName = gradeName;
    subject.termName = termName;
    subject.optionNumber = optionNumber;
    return subject;
  } 
}