import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guardian_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class GuardianDetailsEntity extends BaseLayerDataTransformer<GuardianDetailsEntity,GuardianDetails>{
    @JsonKey(name:'firstName')
    String? firstName;
    @JsonKey(name:'lastName')
    String? lastName;
    @JsonKey(name:'aadharNumber')
    String? aadharNumber;
    @JsonKey(name:'panNumber')
    String? panNumber;
    @JsonKey(name:'relationWithChild')
    String? relationWithChild;
    @JsonKey(name:'houseNumber')
    String? houseNumber;
    @JsonKey(name:'street')
    String? street;
    @JsonKey(name:'landmark')
    String? landmark;
    @JsonKey(name:'country')
    String? country;
    @JsonKey(name:'pincode')
    String? pincode;
    @JsonKey(name:'state')
    String? state;
    @JsonKey(name:'city')
    String? city;
    @JsonKey(name:'emailId')
    String? emailId;
    @JsonKey(name:'mobileNumber')
    String? mobileNumber;
    @JsonKey(name:'qualification')
    String? qualification;
    @JsonKey(name:'occupation')
    String? occupation;
    @JsonKey(name:'organization_name')
    String? organizationName;
    @JsonKey(name:'designation')
    String? designation;
    @JsonKey(name:'office_address')
    String? officeAddress;
    @JsonKey(name:'guardianType')
    String? guardianType;

    GuardianDetailsEntity({
        this.firstName,
        this.lastName,
        this.aadharNumber,
        this.panNumber,
        this.relationWithChild,
        this.houseNumber,
        this.street,
        this.landmark,
        this.country,
        this.pincode,
        this.state,
        this.city,
        this.emailId,
        this.mobileNumber,
        this.guardianType,
      this.qualification,
      this.officeAddress,
      this.occupation,
      this.designation,
      this.organizationName
    });
  factory GuardianDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$GuardianDetailsEntityFromJson(json);

    Map<String, dynamic> toJson() => _$GuardianDetailsEntityToJson(this);

  @override
  GuardianDetails transform() {
    GuardianDetails guardianDetails =GuardianDetails();
    guardianDetails.firstName = firstName;
    guardianDetails.lastName = lastName;
    guardianDetails.aadharNumber = aadharNumber;
    guardianDetails.panNumber = panNumber;
    guardianDetails.relationWithChild = relationWithChild;
    guardianDetails.houseNumber = houseNumber;
    guardianDetails.street = street;
    guardianDetails.landmark = landmark;
    guardianDetails.country = country;
    guardianDetails.pincode = pincode;
    guardianDetails.state = state;
    guardianDetails.city = city;
    guardianDetails.emailId = emailId;
    guardianDetails.mobileNumber = mobileNumber;
    guardianDetails.guardianType = guardianType;
    guardianDetails.occupation = occupation;
    guardianDetails.qualification=qualification;
    guardianDetails.officeAddress=officeAddress;
    guardianDetails.designationName=designation;
    guardianDetails.organisationName=organizationName;
    return guardianDetails;
  }

  @override
  GuardianDetailsEntity restore(GuardianDetails data) {
    GuardianDetailsEntity guardianDetailsEntity = GuardianDetailsEntity(
      firstName: data.firstName,
      lastName: data.lastName,
      aadharNumber: data.aadharNumber,
      panNumber: data.panNumber,
      relationWithChild: data.relationWithChild,
      houseNumber: data.houseNumber,
      street: data.street,
      landmark: data.landmark,
      country: data.country,
      pincode: data.pincode,
      state: data.state,
      city: data.city,
      emailId: data.emailId,
      mobileNumber: data.mobileNumber,
      guardianType: data.guardianType,
      occupation: data.occupation,
      qualification: data.qualification,
      officeAddress: data.officeAddress,
      designation: data.designation,
      organizationName: data.organizationName,
    );
    return guardianDetailsEntity;
  }
}

