import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'guardian_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class GuardianDetailsEntity extends BaseLayerDataTransformer<GuardianDetailsEntity,GuardianDetails>{
    @JsonKey(name: 'global_id')
    String? globalId;
    @JsonKey(name:'firstName')
    String? firstName;
    @JsonKey(name:'lastName')
    String? lastName;
    @JsonKey(name:'aadharNumber')
    String? aadharNumber;
    @JsonKey(name:'panNumber')
    String? panNumber;
    @JsonKey(name:'relationWithChild', fromJson: _fromJson)
    dynamic relationWithChild;
    @JsonKey(name:'houseNumber')
    String? houseNumber;
    @JsonKey(name:'street')
    String? street;
    @JsonKey(name:'landmark')
    String? landmark;
    @JsonKey(name:'country', fromJson: _fromJson)
    dynamic country;
    @JsonKey(name:'area')
    String? area;
    @JsonKey(name:'pincode')
    String? pincode;
    @JsonKey(name:'state',fromJson: _fromJson)
    dynamic state;
    @JsonKey(name:'city',fromJson: _fromJson)
    dynamic city;
    @JsonKey(name:'emailId')
    String? emailId;
    @JsonKey(name:'mobileNumber')
    String? mobileNumber;
    @JsonKey(name:'guardianType')
    String? guardianType;

    GuardianDetailsEntity({
      this.globalId,
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

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> json = {};

      void addIfNotEmpty(String key, dynamic value) {
        if(value is CommonDataEntity){
          if(value.isValid()){
            json[key] = value.toJson();
          }
        }
        else{
          if (value != null && value != '' && value != 'N/A') {
          json[key] = value;
        }
        }
      }

      addIfNotEmpty('global_id', globalId);
      addIfNotEmpty("first_name", firstName);
      addIfNotEmpty("last_name", lastName);
      addIfNotEmpty("mobile", mobileNumber);
      addIfNotEmpty("email", emailId);
      addIfNotEmpty("relationship_with_child", relationWithChild);
      addIfNotEmpty("house", houseNumber);
      addIfNotEmpty("area", area);
      addIfNotEmpty("street", street);
      addIfNotEmpty("landmark", landmark);
      addIfNotEmpty("country", country);
      addIfNotEmpty("pin_code", pincode);
      addIfNotEmpty("state", state);
      addIfNotEmpty("city", city);
      addIfNotEmpty("aadhar", aadharNumber);
      addIfNotEmpty("pan", panNumber);
      addIfNotEmpty("guardian_type", guardianType);

      return json;
    }

  @override
  GuardianDetails transform() {
    GuardianDetails guardianDetails =GuardianDetails();
    guardianDetails.firstName = firstName;
    guardianDetails.lastName = lastName;
    guardianDetails.aadharNumber = aadharNumber;
    guardianDetails.panNumber = panNumber;
    guardianDetails.relationWithChild = (relationWithChild is CommonDataEntity)? relationWithChild?.transform() : relationWithChild;
    guardianDetails.houseNumber = houseNumber;
    guardianDetails.street = street;
    guardianDetails.landmark = landmark;
    guardianDetails.country = (country is CommonDataEntity)? country?.transform() : country;
    guardianDetails.pincode = pincode;
    guardianDetails.state = (state is CommonDataEntity)? state?.transform() : state;
    guardianDetails.city = (city is CommonDataEntity)? city?.transform() : city;
    guardianDetails.emailId = emailId;
    guardianDetails.mobileNumber = mobileNumber;
    guardianDetails.guardianType = guardianType;
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
      relationWithChild: (data.relationWithChild is CommonDataClass)? commonDataEntity.restore(data.relationWithChild!) : data.relationWithChild,
      houseNumber: data.houseNumber,
      street: data.street,
      landmark: data.landmark,
      country: (data.country is CommonDataClass)? commonDataEntity.restore(data.country!) : data.country,
      pincode: data.pincode,
      state: (data.state is CommonDataClass)? commonDataEntity.restore(data.state!) : data.state,
      city: (data.city is CommonDataClass)? commonDataEntity.restore(data.city!) : data.city,
      emailId: data.emailId,
      mobileNumber: data.mobileNumber,
      guardianType: data.guardianType,

    );
    return guardianDetailsEntity;
  }
}

