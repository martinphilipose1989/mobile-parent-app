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
        'nationality: $nationality'
        ')';
  }
}
