class AttributesDetailsModel {
  String? name;
  String? shortName;
  String? shortform;
  String? shortNameTwoDigit;
  String? group;
  String? reason;
  String? occupation;
  String? education;
  String? description;
  String? designation;
  String? nationality;
  int? studentId;
  int? acadminYearId;
  int? schoolId;
  int? brandId;
  int? boardId;
  int? courseId;
  int? gradeId;
  int? divisionId;
  dynamic houseId;
  int? streamId;
  dynamic lobId;
  int? shiftId;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic isUndertakingTaken;
  dynamic undertakingTakenOn;
  dynamic ipDuringUndertaking;
  dynamic kitFeesPaid;
  dynamic kitHandoverApproved;
  int? schoolParentId;
  dynamic promotionalBoard;
  dynamic promotionalStream;
  dynamic nextSchoolId;
  dynamic nextBrandId;
  dynamic nextBoardId;
  dynamic nextCourseId;
  dynamic nextGradeId;
  dynamic nextStreamId;
  dynamic nextLobId;
  dynamic nextShiftId;
  dynamic isDraft;
  dynamic isGuest;
  dynamic hostSchoolId;
  dynamic approvedById;
  dynamic approvedByName;
  dynamic approvedOn;
  dynamic approvedReasonId;

  AttributesDetailsModel({
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
    this.studentId,
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
  });

  @override
  String toString() {
    return 'AttributesDetailsModel('
        'name: $name, '
        'shortName: $shortName, '
        'shortform: $shortform, '
        'shortNameTwoDigit: $shortNameTwoDigit, '
        'group: $group, '
        'reason: $reason, '
        'occupation: $occupation, '
        'education: $education, '
        'description: $description, '
        'designation: $designation, '
        'nationality: $nationality, '
        'studentId: $studentId, '
        'acadminYearId: $acadminYearId, '
        'schoolId: $schoolId, '
        'brandId: $brandId, '
        'boardId: $boardId, '
        'courseId: $courseId, '
        'gradeId: $gradeId, '
        'divisionId: $divisionId, '
        'houseId: $houseId, '
        'streamId: $streamId, '
        'lobId: $lobId, '
        'shiftId: $shiftId, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'isUndertakingTaken: $isUndertakingTaken, '
        'undertakingTakenOn: $undertakingTakenOn, '
        'ipDuringUndertaking: $ipDuringUndertaking, '
        'kitFeesPaid: $kitFeesPaid, '
        'kitHandoverApproved: $kitHandoverApproved, '
        'schoolParentId: $schoolParentId, '
        'promotionalBoard: $promotionalBoard, '
        'promotionalStream: $promotionalStream, '
        'nextSchoolId: $nextSchoolId, '
        'nextBrandId: $nextBrandId, '
        'nextBoardId: $nextBoardId, '
        'nextCourseId: $nextCourseId, '
        'nextGradeId: $nextGradeId, '
        'nextStreamId: $nextStreamId, '
        'nextLobId: $nextLobId, '
        'nextShiftId: $nextShiftId, '
        'isDraft: $isDraft, '
        'isGuest: $isGuest, '
        'hostSchoolId: $hostSchoolId, '
        'approvedById: $approvedById, '
        'approvedByName: $approvedByName, '
        'approvedOn: $approvedOn, '
        'approvedReasonId: $approvedReasonId'
        ')';
  }
}
