import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'attributes_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AttributesDetailsEntity extends BaseLayerDataTransformer<
    AttributesDetailsEntity, AttributesDetailsModel> {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'short_name')
  String? shortName;
  @JsonKey(name: 'shortform')
  String? shortform;
  @JsonKey(name: 'short_name_two_digit')
  String? shortNameTwoDigit;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'reason')
  String? reason;
  @JsonKey(name: 'Name')
  String? occupation;
  @JsonKey(name: 'Education')
  String? education;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'Designation')
  String? designation;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: "student_id")
  final int? studentId;
  @JsonKey(name: "acadmin_year_id")
  final int? acadminYearId;
  @JsonKey(name: "school_id")
  final int? schoolId;
  @JsonKey(name: "brand_id")
  final int? brandId;
  @JsonKey(name: "board_id")
  final int? boardId;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "grade_id")
  final int? gradeId;
  @JsonKey(name: "division_id")
  final int? divisionId;
  @JsonKey(name: "house_id")
  final dynamic houseId;
  @JsonKey(name: "stream_id")
  final int? streamId;
  @JsonKey(name: "lob_id")
  final dynamic lobId;
  @JsonKey(name: "shift_id")
  final int? shiftId;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final dynamic updatedAt;
  @JsonKey(name: "is_undertaking_taken")
  final dynamic isUndertakingTaken;
  @JsonKey(name: "undertaking_taken_on")
  final dynamic undertakingTakenOn;
  @JsonKey(name: "ip_during_undertaking")
  final dynamic ipDuringUndertaking;
  @JsonKey(name: "kit_fees_paid")
  final dynamic kitFeesPaid;
  @JsonKey(name: "kit_handover_approved")
  final dynamic kitHandoverApproved;
  @JsonKey(name: "school_parent_id")
  final int? schoolParentId;
  @JsonKey(name: "promotional_board")
  final dynamic promotionalBoard;
  @JsonKey(name: "promotional_stream")
  final dynamic promotionalStream;
  @JsonKey(name: "next_school_id")
  final dynamic nextSchoolId;
  @JsonKey(name: "next_brand_id")
  final dynamic nextBrandId;
  @JsonKey(name: "next_board_id")
  final dynamic nextBoardId;
  @JsonKey(name: "next_course_id")
  final dynamic nextCourseId;
  @JsonKey(name: "next_grade_id")
  final dynamic nextGradeId;
  @JsonKey(name: "next_stream_id")
  final dynamic nextStreamId;
  @JsonKey(name: "next_lob_id")
  final dynamic nextLobId;
  @JsonKey(name: "next_shift_id")
  final dynamic nextShiftId;
  @JsonKey(name: "is_draft")
  final dynamic isDraft;
  @JsonKey(name: "is_guest")
  final dynamic isGuest;
  @JsonKey(name: "host_school_id")
  final dynamic hostSchoolId;
  @JsonKey(name: "approved_by_id")
  final dynamic approvedById;
  @JsonKey(name: "approved_by_name")
  final dynamic approvedByName;
  @JsonKey(name: "approved_on")
  final dynamic approvedOn;
  @JsonKey(name: "approved_reason_id")
  final dynamic approvedReasonId;

  AttributesDetailsEntity({
    this.name,
    this.shortName,
    this.shortform,
    this.shortNameTwoDigit,
    this.group,
    this.reason,
    this.occupation,
    this.education,
    this.description,
    this.designation,
    this.nationality,
    this.acadminYearId,
    this.schoolId,
    this.brandId,
    this.boardId,
    this.courseId,
    this.gradeId,
    this.divisionId,
    this.houseId,
    this.streamId,
    this.lobId,
    this.shiftId,
    this.createdAt,
    this.updatedAt,
    this.isUndertakingTaken,
    this.undertakingTakenOn,
    this.ipDuringUndertaking,
    this.kitFeesPaid,
    this.kitHandoverApproved,
    this.schoolParentId,
    this.promotionalBoard,
    this.promotionalStream,
    this.nextSchoolId,
    this.nextBrandId,
    this.nextBoardId,
    this.nextCourseId,
    this.nextGradeId,
    this.nextStreamId,
    this.nextLobId,
    this.nextShiftId,
    this.isDraft,
    this.isGuest,
    this.hostSchoolId,
    this.approvedById,
    this.approvedByName,
    this.approvedOn,
    this.approvedReasonId,
    this.studentId,
  });

  factory AttributesDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$AttributesDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesDetailsEntityToJson(this);

  @override
  AttributesDetailsModel transform() {
    AttributesDetailsModel model = AttributesDetailsModel();
    model.name = name;
    model.shortName = shortName;
    model.shortform = shortform;
    model.shortNameTwoDigit = shortNameTwoDigit;
    model.group = group;
    model.reason = reason;
    model.occupation = occupation;
    model.education = education;
    model.description = description;
    model.nationality = nationality;
    model.designation = designation;
    model.acadminYearId = acadminYearId;
    model.schoolId = schoolId;
    model.brandId = brandId;
    model.boardId = boardId;
    model.courseId = courseId;
    model.gradeId = gradeId;
    model.divisionId = divisionId;
    model.houseId = houseId;
    model.streamId = streamId;
    model.lobId = lobId;
    model.shiftId = shiftId;
    model.createdAt = createdAt;
    model.updatedAt = updatedAt;
    model.isUndertakingTaken = isUndertakingTaken;
    model.undertakingTakenOn = undertakingTakenOn;
    model.ipDuringUndertaking = ipDuringUndertaking;
    model.kitFeesPaid = kitFeesPaid;
    model.kitHandoverApproved = kitHandoverApproved;
    model.schoolParentId = schoolParentId;
    model.promotionalBoard = promotionalBoard;
    model.promotionalStream = promotionalStream;
    model.nextSchoolId = nextSchoolId;
    model.nextBrandId = nextBrandId;
    model.nextBoardId = nextBoardId;
    model.nextCourseId = nextCourseId;
    model.nextGradeId = nextGradeId;
    model.nextStreamId = nextStreamId;
    model.nextLobId = nextLobId;
    model.nextShiftId = nextShiftId;
    model.isDraft = isDraft;
    model.isGuest = isGuest;
    model.hostSchoolId = hostSchoolId;
    model.approvedById = approvedById;
    model.approvedByName = approvedByName;
    model.approvedOn = approvedOn;
    model.approvedReasonId = approvedReasonId;
    model.studentId = studentId;

    return model;
  }
}
