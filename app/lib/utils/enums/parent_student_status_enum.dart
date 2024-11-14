enum ParentStudentStatusEnum {
  enquiry(0),
  admission(1);

  final int status;

  const ParentStudentStatusEnum(this.status);

  // Static method to map an integer to an enum value
  static ParentStudentStatusEnum fromStatus(int statusId) {
    return ParentStudentStatusEnum.values.firstWhere(
      (e) => e.status == statusId,
      orElse: () =>
          ParentStudentStatusEnum.enquiry, // default value if no match
    );
  }
}
