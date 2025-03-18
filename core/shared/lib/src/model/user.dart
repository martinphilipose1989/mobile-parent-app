// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? userName;
  String? email;
  String? phoneNumber;
  int? statusId;
  String? token;
  User(
      {this.id,
      this.userName,
      this.email,
      this.phoneNumber,
      this.statusId,
      this.token});

  @override
  String toString() {
    return "User(id: $id,userName: $userName,phoneNumber: $phoneNumber,statusId:$statusId)";
  }
}
