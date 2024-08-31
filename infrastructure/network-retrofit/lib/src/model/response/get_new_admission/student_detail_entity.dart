import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'student_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class StudentDetailsEntity extends BaseLayerDataTransformer<StudentDetailsEntity,StudentDetails>{
    @JsonKey(name: 'first_name')
    String? firstName;
    @JsonKey(name: 'last_name')
    String? lastName;
    @JsonKey(name: 'grade')
    CommonDataEntity? grade;
    @JsonKey(name: 'gender')
    CommonDataEntity? gender;
    @JsonKey(name: 'dob')
    String? dob;
    @JsonKey(name: 'eligible_grade')
    String? eligibleGrade;
    @JsonKey(name: 'place_of_birth')
    String? placeOfBirth;
    @JsonKey(name: 'religion')
    String? religion;
    @JsonKey(name: 'caste')
    String? caste;
    @JsonKey(name: 'sub_caste')
    String? subCaste;
    @JsonKey(name: 'nationality')
    String? nationality;
    @JsonKey(name: 'mother_tongue')
    String? motherTongue;
    @JsonKey(name: 'aadhar')
    String? aadhar;
    @JsonKey(name: 'global_id')
    String? globalId;

    StudentDetailsEntity({
     this.firstName,
     this.lastName,
     this.grade,
     this.gender,
     this.dob,
     this.eligibleGrade,
     this.placeOfBirth,
     this.religion,
     this.caste,
     this.subCaste,
     this.nationality,
     this.motherTongue,
     this.aadhar,
     this.globalId,
    });

  factory StudentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson(){
    var request = {
      "first_name": firstName,
      "last_name": lastName,
      "grade": grade?.toJson(),
      "gender": gender?.toJson(),
      "dob": dob,
      "eligible_grade": eligibleGrade,
    };
    if(placeOfBirth!=null && (placeOfBirth??'').isNotEmpty){
      request.addAll({"place_of_birth":placeOfBirth});
    }
    if(religion!=null && (religion??'').isNotEmpty){
      request.addAll({"religion":religion});
    }
    if(caste!=null && (caste??'').isNotEmpty){
      request.addAll({"caste":caste});
    }
    if(subCaste!=null && (subCaste??'').isNotEmpty){
      request.addAll({"sub_caste":subCaste});
    }
    if(nationality!=null && (nationality??'').isNotEmpty){
      request.addAll({"nationality":nationality});
    }
    if(motherTongue!=null && (motherTongue??'').isNotEmpty){
      request.addAll({"mother_tongue":motherTongue});
    } 
    if(aadhar!=null && (aadhar??'').isNotEmpty){
      request.addAll({"aadhar":aadhar});
    } 
    if(globalId!=null && (globalId??'').isNotEmpty){
      request.addAll({"global_id":globalId});
    } 
    return request;
  }

  @override
  StudentDetails transform() {
    StudentDetails studentDetails = StudentDetails();
    studentDetails.dob = dob;
    studentDetails.eligibleGrade = eligibleGrade;
    studentDetails.firstName = firstName;
    studentDetails.lastName = lastName;
    studentDetails.gender = gender?.transform();
    studentDetails.grade = grade?.transform();
    studentDetails.placeOfBirth = placeOfBirth;
    studentDetails.religion = religion;
    studentDetails.caste = caste;
    studentDetails.subCaste = subCaste;
    studentDetails.nationality = nationality;
    studentDetails.motherTongue = motherTongue;
    studentDetails.aadhar = aadhar;
    studentDetails.globalId = globalId;
    return studentDetails;
  }

  @override
  StudentDetailsEntity restore(StudentDetails data) {
    CommonDataEntity commonDataEntity = CommonDataEntity();
    StudentDetailsEntity studentDetailsEntity = StudentDetailsEntity(
      firstName : data.firstName,
      lastName : data.lastName,
      grade : commonDataEntity.restore(data.grade!),
      gender : commonDataEntity.restore(data.gender!),
      dob : data.dob,
      eligibleGrade : data.eligibleGrade,
      placeOfBirth : data.placeOfBirth,
      religion : data.religion,
      caste : data.caste,
      subCaste : data.subCaste,
      nationality : data.nationality,
      motherTongue : data.motherTongue,
      aadhar : data.aadhar,
      globalId : data.globalId,
    );
    return studentDetailsEntity;
  }

}