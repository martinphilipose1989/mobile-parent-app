import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'guardian_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
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
    dynamic country;
    @JsonKey(name:'area')
    String? area;
    @JsonKey(name:'pincode')
    String? pincode;
    @JsonKey(name:'state')
    dynamic state;
    @JsonKey(name:'city')
    dynamic city;
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
      this.area,
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

  static dynamic _fromJson(dynamic data){
    if(data is Map<String,dynamic>){
      return CommonDataEntity.fromJson(data);
    }
    else{
      return data;
    }
  }

    Map<String, dynamic> toJson() => {
      "first_name": firstName,
      "last_name": lastName,
      "mobile": mobileNumber,
      "email": emailId,
      "relationship_with_child": relationWithChild,
      "house": houseNumber,
      "area": area,
      "street": street,
      "landmark": landmark,
      "country": country,
      "pin_code": pincode,
      "state": state,
      "city": city,
      "aadhar": aadharNumber,
      "pan": panNumber,
      "guardian_type": guardianType
    };

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
    guardianDetails.area = area;
    guardianDetails.country = (country is CommonDataEntity)? country?.transform() : country;
    guardianDetails.pincode = pincode;
    guardianDetails.state = (state is CommonDataEntity)? state?.transform() : state;
    guardianDetails.city = (city is CommonDataEntity)? city?.transform() : city;
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
    CommonDataEntity commonDataEntity = CommonDataEntity();
    GuardianDetailsEntity guardianDetailsEntity = GuardianDetailsEntity(
      firstName: data.firstName,
      lastName: data.lastName,
      aadharNumber: data.aadharNumber,
      panNumber: data.panNumber,
      relationWithChild: data.relationWithChild,
      houseNumber: data.houseNumber,
      street: data.street,
      landmark: data.landmark,
      country: (data.country is CommonDataClass)? commonDataEntity.restore(data.country!) : data.country,
      area: data.area,
      pincode: data.pincode,
      state: (data.state is CommonDataClass)? commonDataEntity.restore(data.state!) : data.state,
      city: (data.city is CommonDataClass)? commonDataEntity.restore(data.city!) : data.city,
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

