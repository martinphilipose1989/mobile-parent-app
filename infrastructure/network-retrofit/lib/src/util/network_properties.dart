class NetworkProperties {
  static const String mdmBaseUrl = "https://ampersand-r26sp3mibq-uc.a.run.app";
  // UAT
  //static const String mdmBaseUrl = "https://mdm-strapi-uat.ampersandgroup.in";

  // static const String marketingBaseURL =
  //     'https://marketing-r26sp3mibq-uc.a.run.app/';
  //UAT
  // static const String marketingBaseURL =
  //     'https://marketing-backend-ndxpitoqla-el.a.run.app/';

  static const String schoolBoard = '/api/ac-boards';
  static const String grade = '/api/ac-grades';
  static const String gender = '/api/genders';
  static const String cources = '/api/ac-courses';
  static const String stream = '/api/ac-streams';
  static const String shifts = '/api/ac-shifts';
  static const String cancelationReason = '/api/ad-followup-reasons';
  static const String countries = '/api/countries';
  static const String states = '/api/states';
  static const String city = '/api/cities';
  static const String schoolLocation = '/api/ac-schools';
  static const String batch = '/api/ac-batches';
  static const String academicYear =
      '/api/ac-academic-years?fields[1]=name&fields[2]=short_name&fields[3]=short_name_two_digit';
  static const String psaSubType =
      '/api/ac-spa-activity-types?fields[1]=name&fields[2]=short_name';
  static const String psaCategory =
      '/api/ac-spa-categories?fields[1]=name&fields[2]=short_name';
  static const String psaSubCategory =
      '/api/ac-spa-subjects?fields[1]=name&fields[2]=short_name';
  static const String periodOfService =
      '/api/fc-period-of-services?fields[1]=name';
  static const String bloodGroup = '/api/blood-groups?fields=group';
  static const String occupation =
      '/api/co-occupations?fields[1]=Name&fields[2]=Short_Name&fields[3]=Order';
  static const String qualifications =
      '/api/co-qualifications?fields[1]=Education&fields[2]=Description';
  static const String religions = '/api/religions?fields[1]=name';
  static const String castes =
      '/api/castes?fields[1]=name&fields[2]=short_name';
  static const String subCastes = '/api/sub-castes?fields[1]=name';
  static const String motherTongue = '/api/mother-tongues?fields[1]=name';
  static const String organization = '/api/organizations?fields[1]=name';
  static const String designation = '/api/ps-designations';
  static const String nationality =
      '/api/countries?sort[0]=id:asc&fields[1]=nationality&fields[2]=name';
  static const String personalisedLearningNeedsDescription =
      '/api/ac-personalise-learning-needs?fields[1]=name';
  static const String cityAndState =
      '/api/co-pincodes?populate[0]=District_Or_City&populate[1]=State';
  static const String relationWithChild =
      '/api/co-guardian-relationships?fields[1]=name';

  static const String mdmModule = "$mdmBaseUrl/api/co-reasons";

  static const String getBrandList = "$mdmBaseUrl/api/ac-brands";
}
