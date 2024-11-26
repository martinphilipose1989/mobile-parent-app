class NetworkProperties {
 // static const String mdmBaseUrl = "https://ampersand-r26sp3mibq-uc.a.run.app";
  // UAT
  static const String mdmBaseUrl = "https://mdm-strapi-uat.ampersandgroup.in";
  // static const String financeBaseUrl =
  //     "https://finance-r26sp3mibq-uc.a.run.app";
  //UAT
  static const String financeBaseUrl =
      "https://finance-backend-ndxpitoqla-el.a.run.app";
  // static const String marketingBaseURL =
  //     'https://marketing-r26sp3mibq-uc.a.run.app/';
  //UAT
  static const String marketingBaseURL =
      'https://marketing-backend-ndxpitoqla-el.a.run.app/';
  static const String transportBaseURL =
      'https://transport-219111640528.us-central1.run.app/';
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

  // static const String enrollmentDetail =
  //     'https://admin-panel-backend-r26sp3mibq-uc.a.run.app/admin/studentProfile/getEnrollmentDetail';
  // UAT
  static const String enrollmentDetail =
      'https://admin-panel-backend-ndxpitoqla-el.a.run.app/admin/studentProfile/getEnrollmentDetail';

  // static const String subjetcList =
  //     'https://admin-panel-backend-r26sp3mibq-uc.a.run.app/admin/school-subject/fetch-school-subjects';
  //UAT
  static const String subjetcList =
      'https://admin-panel-backend-ndxpitoqla-el.a.run.app/admin/school-subject/fetch-school-subjects';
  // static const String requestGatePass =
  //     "https://gate-management-r26sp3mibq-uc.a.run.app/gate-management/gatepass/cross-platform/create";

  static const String mdmModule = "$mdmBaseUrl/api/co-reasons";

  ////-----GATE PASS ----///
  /// GATE PASS API BASE:
  // static const String BASE_GATE_PASS =
  //     "https://gate-management-r26sp3mibq-uc.a.run.app/";

  // UAT
  static const String BASE_GATE_PASS =
      "https://gate-management-backend-869610231867.asia-south1.run.app/";

  /// GATE PASS API ENDPOINTS:
  static const String createVisitorGatePass =
      "${BASE_GATE_PASS}gate-management/gatepass/cross-platform/create";
  //  "${BASE_GATE_PASS}gate-management/visitor/create";
  static const String uploadProfileImage =
      "${BASE_GATE_PASS}gate-management/visitor/upload-profile-image";

  static const String getVisitorDetails =
      "${BASE_GATE_PASS}gate-management/gatepass";

  static const String getGatePassDetails =
      "${BASE_GATE_PASS}gate-management/gatepass/{gatepassId}";

  static const String requestGatePass =
      'https://gate-management-backend-869610231867.asia-south1.run.app/gate-management/gatepass/cross-platform/create';

  // key cloak
  // static const String tokenIntroSpect =
  //     "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/token/introspect";

  //UAT
  static const String tokenIntroSpect =
      "https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/token/introspect";

  static const String getBrandList = "$mdmBaseUrl/api/ac-brands";
}
