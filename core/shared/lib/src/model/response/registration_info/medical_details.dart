class MedicalDetails{
    bool? isChildHospitalised;
    String? yearOfHospitalization;
    String? reasonOfHopitalization;
    bool? hasPhysicalDisability;
    String? physicalDisabilityDescription;
    bool? hasMedicalHistory;
    String? medicalHistoryDescription;
    bool? hasAllergy;
    String? allergyDescription;
    dynamic bloodGroup;
    bool? hasPersonalisedLearningNeeds;
    String? personalisedLearningNeedsDescription;

    MedicalDetails({
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

}