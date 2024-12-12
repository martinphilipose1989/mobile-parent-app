enum EnquiryTypeEnum {
  newAdmission("Enquiry - New Admission"),
  psa("Enquiry - PSA"),
  kidsClub("Enquiry - Kids club");

  final String type;

  const EnquiryTypeEnum(this.type);
}

enum FeesTypeIdEnum {
  admissionFees(1),
  cafeteriaFees(2),
  kidsClubFees(8),
  psaFess(11),
  registrationFees(12),
  summerCampFees(13),
  transportFees(15);

  final int id;

  const FeesTypeIdEnum(this.id);
}

enum Modules {
  admission,
  enquiry,
  finance,
  ticketing,
  gatepass,
}
