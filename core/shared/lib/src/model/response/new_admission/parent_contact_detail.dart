class ParentContactDetail {
  String? globalId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;

  ParentContactDetail(
      {this.globalId, this.firstName, this.lastName, this.email, this.mobile});

  @override
  String toString() {
    return 'ParentContactDetail(globalId: $globalId, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile)';
  }
}
