class VasEnrollmentRequest {
  int? transportBusType;
  int? transportServiceType;
  String? transportRouteType;
  String? transportPickupPoint;
  String? transportDropPoint;
  int? transportAmount;
  int? cafeteriaOptFor;
  int? cafeteriaPeriodOfService;
  int? cafeteriaAmount;
  int? kidsClubType;
  int? kidsClubPeriodOfService;
  int? kidsClubMonth;
  int? kidsClubCafeteriaOptFor;
  int? kidsClubAmount;
  int? psaSubType;
  int? psaCategory;
  int? psaSubCategory;
  int? psaPeriodOfService;
  int? psaBatch;
  int? psaAmount;
  int? summerCampSubType;
  int? summerCampCategory;
  int? summerCampPeriodOfService;
  int? summerCampBatch;
  int? summerCampAmount;
  String? feeSubCategoryStart;
  String? feeSubCategoryEnd;

  VasEnrollmentRequest(
      {this.transportBusType,
      this.transportServiceType,
      this.transportRouteType,
      this.transportPickupPoint,
      this.transportDropPoint,
      this.transportAmount,
      this.cafeteriaOptFor,
      this.cafeteriaPeriodOfService,
      this.cafeteriaAmount,
      this.kidsClubType,
      this.kidsClubPeriodOfService,
      this.kidsClubMonth,
      this.kidsClubCafeteriaOptFor,
      this.kidsClubAmount,
      this.psaSubType,
      this.psaCategory,
      this.psaSubCategory,
      this.psaPeriodOfService,
      this.psaBatch,
      this.psaAmount,
      this.summerCampSubType,
      this.summerCampCategory,
      this.summerCampPeriodOfService,
      this.summerCampBatch,
      this.summerCampAmount,
      this.feeSubCategoryStart,
      this.feeSubCategoryEnd});

  VasEnrollmentRequest.fromJson(Map<String, dynamic> json) {
    transportBusType = json['transportBusType'];
    transportServiceType = json['transportServiceType'];
    transportRouteType = json['transportRouteType'];
    transportPickupPoint = json['transportPickupPoint'];
    transportDropPoint = json['transportDropPoint'];
    transportAmount = json['transportAmount'];
    cafeteriaOptFor = json['cafeteriaOptFor'];
    cafeteriaPeriodOfService = json['cafeteriaPeriodOfService'];
    cafeteriaAmount = json['cafeteriaAmount'];
    kidsClubType = json['kidsClubType'];
    kidsClubPeriodOfService = json['kidsClubPeriodOfService'];
    kidsClubMonth = json['kidsClubMonth'];
    kidsClubCafeteriaOptFor = json['kidsClubCafeteriaOptFor'];
    kidsClubAmount = json['kidsClubAmount'];
    psaSubType = json['psaSubType'];
    psaCategory = json['psaCategory'];
    psaSubCategory = json['psaSubCategory'];
    psaPeriodOfService = json['psaPeriodOfService'];
    psaBatch = json['psaBatch'];
    psaAmount = json['psaAmount'];
    summerCampSubType = json['summerCampSubType'];
    summerCampCategory = json['summerCampCategory'];
    summerCampPeriodOfService = json['summerCampPeriodOfService'];
    summerCampBatch = json['summerCampBatch'];
    summerCampAmount = json['summerCampAmount'];
    feeSubCategoryStart = json['fee_subcategory_start'];
    feeSubCategoryEnd = json['fee_subcategory_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['transportBusType'] = transportBusType;
    data['transportServiceType'] = transportServiceType;
    data['transportRouteType'] = transportRouteType;
    data['transportPickupPoint'] = transportPickupPoint;
    data['transportDropPoint'] = transportDropPoint;
    data['transportAmount'] = transportAmount;
    data['cafeteriaOptFor'] = cafeteriaOptFor;
    data['cafeteriaPeriodOfService'] = cafeteriaPeriodOfService;
    data['cafeteriaAmount'] = cafeteriaAmount;
    data['kidsClubType'] = kidsClubType;
    data['kidsClubPeriodOfService'] = kidsClubPeriodOfService;
    data['kidsClubMonth'] = kidsClubMonth;
    data['kidsClubCafeteriaOptFor'] = kidsClubCafeteriaOptFor;
    data['kidsClubAmount'] = kidsClubAmount;
    data['psaSubType'] = psaSubType;
    data['psaCategory'] = psaCategory;
    data['psaSubCategory'] = psaSubCategory;
    data['psaPeriodOfService'] = psaPeriodOfService;
    data['psaBatch'] = psaBatch;
    data['psaAmount'] = psaAmount;
    data['summerCampSubType'] = summerCampSubType;
    data['summerCampCategory'] = summerCampCategory;
    data['summerCampPeriodOfService'] = summerCampPeriodOfService;
    data['summerCampBatch'] = summerCampBatch;
    data['summerCampAmount'] = summerCampAmount;
    data['fee_subcategory_start'] = feeSubCategoryStart;
    data['fee_subcategory_end'] = feeSubCategoryEnd;
    return data;
  }
}
