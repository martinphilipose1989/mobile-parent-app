import 'package:data/data.dart';

class EmergencyContactEntity extends BaseLayerDataTransformer<EmergencyContactEntity,EmergencyContact>{
    String? emergencyContact;

    EmergencyContactEntity({
        this.emergencyContact,
    });

    factory EmergencyContactEntity.fromJson(Map<String, dynamic> json) => EmergencyContactEntity(
        emergencyContact: json["emergency_contact"],
    );

    Map<String, dynamic> toJson() => {
        "emergency_contact": emergencyContact,
    };

  @override
  EmergencyContact transform() {
    EmergencyContact emergencyContactModel = EmergencyContact();
    emergencyContactModel.emergencyContact = emergencyContact;
    return emergencyContactModel;
  }

  @override
  EmergencyContactEntity restore(EmergencyContact data) {
    EmergencyContactEntity emergencyContactEntity =EmergencyContactEntity(
      emergencyContact: data.emergencyContact
    );
    return emergencyContactEntity;
  }
}