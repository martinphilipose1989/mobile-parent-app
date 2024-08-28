import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicalDetailsEntity extends BaseLayerDataTransformer<MedicalDetailsEntity,MedicalDetails>{
    @JsonKey(name: 'isChildHospitalised')
    bool? isChildHospitalised;
    @JsonKey(name: 'yearOfHospitalization')
    String? yearOfHospitalization;
    @JsonKey(name: 'reasonOfHopitalization')
    String? reasonOfHopitalization;
    @JsonKey(name: 'hasPhysicalDisability')
    bool? hasPhysicalDisability;
    @JsonKey(name: 'physicalDisabilityDescription')
    String? physicalDisabilityDescription;
    @JsonKey(name: 'hasMedicalHistory')
    bool? hasMedicalHistory;
    @JsonKey(name: 'medicalHistoryDescription')
    String? medicalHistoryDescription;
    @JsonKey(name: 'hasAllergy')
    bool? hasAllergy;
    @JsonKey(name: 'allergyDescription')
    String? allergyDescription;
    @JsonKey(name: 'bloodGroup')
    String? bloodGroup;
    @JsonKey(name: 'hasPersonalisedLearningNeeds')
    bool? hasPersonalisedLearningNeeds;
    @JsonKey(name: 'personalisedLearningNeedsDescription')
    String? personalisedLearningNeedsDescription;

    MedicalDetailsEntity({
        this.isChildHospitalised,
        this.yearOfHospitalization,
        this.reasonOfHopitalization,
        this.hasPhysicalDisability,
        this.physicalDisabilityDescription,
        this.hasMedicalHistory,
        this.medicalHistoryDescription,
        this.hasAllergy,
        this.allergyDescription,
        this.bloodGroup,
        this.hasPersonalisedLearningNeeds,
        this.personalisedLearningNeedsDescription,
    });

    factory MedicalDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$MedicalDetailsEntityFromJson(json);

    Map<String, dynamic> toJson() => _$MedicalDetailsEntityToJson(this);

  @override
  MedicalDetails transform() {
    MedicalDetails medicalDetails = MedicalDetails();
    medicalDetails.isChildHospitalised = isChildHospitalised;
    medicalDetails.yearOfHospitalization = yearOfHospitalization;
    medicalDetails.reasonOfHopitalization = reasonOfHopitalization;
    medicalDetails.hasPhysicalDisability = hasPhysicalDisability;
    medicalDetails.physicalDisabilityDescription = physicalDisabilityDescription;
    medicalDetails.hasMedicalHistory = hasMedicalHistory;
    medicalDetails.medicalHistoryDescription = medicalHistoryDescription;
    medicalDetails.hasAllergy = hasAllergy;
    medicalDetails.allergyDescription = allergyDescription;
    medicalDetails.bloodGroup = bloodGroup;
    medicalDetails.hasPersonalisedLearningNeeds = hasPersonalisedLearningNeeds;
    medicalDetails.personalisedLearningNeedsDescription = personalisedLearningNeedsDescription;
    return medicalDetails;
  }

  @override
  MedicalDetailsEntity restore(MedicalDetails data) {
    MedicalDetailsEntity medicalDetailsEntity = MedicalDetailsEntity(
      isChildHospitalised: data.isChildHospitalised,
      yearOfHospitalization: data.yearOfHospitalization,
      reasonOfHopitalization: data.reasonOfHopitalization,
      hasPhysicalDisability: data.hasPhysicalDisability,
      physicalDisabilityDescription: data.physicalDisabilityDescription,
      hasMedicalHistory: data.hasMedicalHistory,
      medicalHistoryDescription: data.medicalHistoryDescription,
      hasAllergy: data.hasAllergy,
      allergyDescription: data.allergyDescription,
      bloodGroup: data.bloodGroup,
      hasPersonalisedLearningNeeds: data.hasPersonalisedLearningNeeds,
      personalisedLearningNeedsDescription: data.personalisedLearningNeedsDescription,
    );
    return medicalDetailsEntity;
  }

}