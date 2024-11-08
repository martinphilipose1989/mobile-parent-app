class PhoneNumberDetails {
  final String countryCode;
  final String e164;
  final String national;
  final String type;
  final String international;
  final String nationalNumber;
  final String regionCode;

  PhoneNumberDetails({
    required this.countryCode,
    required this.e164,
    required this.national,
    required this.type,
    required this.international,
    required this.nationalNumber,
    required this.regionCode,
  });

  // Factory constructor to create a PhoneNumberDetails object from a map
  factory PhoneNumberDetails.fromMap(Map<String, dynamic> map) {
    return PhoneNumberDetails(
      countryCode: map['country_code'] as String,
      e164: map['e164'] as String,
      national: map['national'] as String,
      type: map['type'] as String,
      international: map['international'] as String,
      nationalNumber: map['national_number'] as String,
      regionCode: map['region_code'] as String,
    );
  }

  // Method to convert a PhoneNumberDetails object back to a map
  Map<String, dynamic> toMap() {
    return {
      'country_code': countryCode,
      'e164': e164,
      'national': national,
      'type': type,
      'international': international,
      'national_number': nationalNumber,
      'region_code': regionCode,
    };
  }

  @override
  String toString() {
    return 'PhoneNumberDetails(countryCode: $countryCode, e164: $e164, national: $national, type: $type, international: $international, nationalNumber: $nationalNumber, regionCode: $regionCode)';
  }
}
