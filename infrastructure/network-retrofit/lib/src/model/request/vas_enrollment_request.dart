// class VasEnrollmentRequest {
//   int? transportBusType;
//   int? transportServiceType;
//   String? transportRouteType;
//   String? transportPickupPoint;
//   String? transportDropPoint;
//   int? transportAmount;
//   int? cafeteriaOptFor;
//   int? cafeteriaPeriodOfService;
//   int? cafeteriaAmount;
//   int? kidsClubType;
//   int? kidsClubPeriodOfService;
//   int? kidsClubMonth;
//   int? kidsClubCafeteriaOptFor;
//   int? kidsClubAmount;
//   int? psaSubType;
//   int? psaCategory;
//   int? psaSubCategory;
//   int? psaPeriodOfService;
//   int? psaBatch;
//   int? psaAmount;
//   int? summerCampSubType;
//   int? summerCampCategory;
//   int? summerCampPeriodOfService;
//   int? summerCampBatch;
//   int? summerCampAmount;
//   String? feeSubCategoryStart;
//   String? feeSubCategoryEnd;

//   VasEnrollmentRequest(
//       {this.transportBusType,
//       this.transportServiceType,
//       this.transportRouteType,
//       this.transportPickupPoint,
//       this.transportDropPoint,
//       this.transportAmount,
//       this.cafeteriaOptFor,
//       this.cafeteriaPeriodOfService,
//       this.cafeteriaAmount,
//       this.kidsClubType,
//       this.kidsClubPeriodOfService,
//       this.kidsClubMonth,
//       this.kidsClubCafeteriaOptFor,
//       this.kidsClubAmount,
//       this.psaSubType,
//       this.psaCategory,
//       this.psaSubCategory,
//       this.psaPeriodOfService,
//       this.psaBatch,
//       this.psaAmount,
//       this.summerCampSubType,
//       this.summerCampCategory,
//       this.summerCampPeriodOfService,
//       this.summerCampBatch,
//       this.summerCampAmount,
//       this.feeSubCategoryStart,
//       this.feeSubCategoryEnd});

//   VasEnrollmentRequest.fromJson(Map<String, dynamic> json) {
//     transportBusType = json['transportBusType'];
//     transportServiceType = json['transportServiceType'];
//     transportRouteType = json['transportRouteType'];
//     transportPickupPoint = json['transportPickupPoint'];
//     transportDropPoint = json['transportDropPoint'];
//     transportAmount = json['transportAmount'];
//     cafeteriaOptFor = json['cafeteriaOptFor'];
//     cafeteriaPeriodOfService = json['cafeteriaPeriodOfService'];
//     cafeteriaAmount = json['cafeteriaAmount'];
//     kidsClubType = json['kidsClubType'];
//     kidsClubPeriodOfService = json['kidsClubPeriodOfService'];
//     kidsClubMonth = json['kidsClubMonth'];
//     kidsClubCafeteriaOptFor = json['kidsClubCafeteriaOptFor'];
//     kidsClubAmount = json['kidsClubAmount'];
//     psaSubType = json['psaSubType'];
//     psaCategory = json['psaCategory'];
//     psaSubCategory = json['psaSubCategory'];
//     psaPeriodOfService = json['psaPeriodOfService'];
//     psaBatch = json['psaBatch'];
//     psaAmount = json['psaAmount'];
//     summerCampSubType = json['summerCampSubType'];
//     summerCampCategory = json['summerCampCategory'];
//     summerCampPeriodOfService = json['summerCampPeriodOfService'];
//     summerCampBatch = json['summerCampBatch'];
//     summerCampAmount = json['summerCampAmount'];
//     feeSubCategoryStart = json['fee_subcategory_start'];
//     feeSubCategoryEnd = json['fee_subcategory_end'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['transportBusType'] = transportBusType;
//     data['transportServiceType'] = transportServiceType;
//     data['transportRouteType'] = transportRouteType;
//     data['transportPickupPoint'] = transportPickupPoint;
//     data['transportDropPoint'] = transportDropPoint;
//     data['transportAmount'] = transportAmount;
//     data['cafeteriaOptFor'] = cafeteriaOptFor;
//     data['cafeteriaPeriodOfService'] = cafeteriaPeriodOfService;
//     data['cafeteriaAmount'] = cafeteriaAmount;
//     data['kidsClubType'] = kidsClubType;
//     data['kidsClubPeriodOfService'] = kidsClubPeriodOfService;
//     data['kidsClubMonth'] = kidsClubMonth;
//     data['kidsClubCafeteriaOptFor'] = kidsClubCafeteriaOptFor;
//     data['kidsClubAmount'] = kidsClubAmount;
//     data['psaSubType'] = psaSubType;
//     data['psaCategory'] = psaCategory;
//     data['psaSubCategory'] = psaSubCategory;
//     data['psaPeriodOfService'] = psaPeriodOfService;
//     data['psaBatch'] = psaBatch;
//     data['psaAmount'] = psaAmount;
//     data['summerCampSubType'] = summerCampSubType;
//     data['summerCampCategory'] = summerCampCategory;
//     data['summerCampPeriodOfService'] = summerCampPeriodOfService;
//     data['summerCampBatch'] = summerCampBatch;
//     data['summerCampAmount'] = summerCampAmount;
//     data['fee_subcategory_start'] = feeSubCategoryStart;
//     data['fee_subcategory_end'] = feeSubCategoryEnd;
//     return data;
//   }
// }

class VasEnrollmentRequest {
  VasCategorySelection? kidsClub;
  VasCategorySelection? cafeteria;
  VasCategorySelection? psa;
  VasCategorySelection? summerCamp;
  Transport? transport;

  VasEnrollmentRequest({
    this.kidsClub,
    this.cafeteria,
    this.psa,
    this.summerCamp,
    this.transport,
  });

  factory VasEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      VasEnrollmentRequest(
        kidsClub: json["kids_club"] == null
            ? null
            : VasCategorySelection.fromJson(json["kids_club"]),
        cafeteria: json["cafeteria"] == null
            ? null
            : VasCategorySelection.fromJson(json["cafeteria"]),
        psa: json["psa"] == null
            ? null
            : VasCategorySelection.fromJson(json["psa"]),
        summerCamp: json["summer_camp"] == null
            ? null
            : VasCategorySelection.fromJson(json["summer_camp"]),
        transport: json["transport"] == null
            ? null
            : Transport.fromJson(json["transport"]),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (kidsClub != null) {
      data["kids_club"] = kidsClub?.toJson();
    }
    if (cafeteria != null) {
      data["cafeteria"] = cafeteria?.toJson();
    }
    if (psa != null) {
      data["psa"] = psa?.toJson();
    }
    if (summerCamp != null) {
      data["summer_camp"] = summerCamp?.toJson();
    }
    if (transport != null) {
      data["transport"] = transport?.toJson();
    }
    return data;
  }
}

class VasCategorySelection {
  int? feeTypeId;
  int? feeCategoryId;
  int? periodOfServiceId;
  int? amount;
  int? batchId;
  int? feeSubTypeId;
  int? feeSubcategoryId;

  VasCategorySelection({
    this.feeTypeId,
    this.feeCategoryId,
    this.periodOfServiceId,
    this.amount,
    this.batchId,
    this.feeSubTypeId,
    this.feeSubcategoryId,
  });

  factory VasCategorySelection.fromJson(Map<String, dynamic> json) =>
      VasCategorySelection(
        feeTypeId: json["fee_type_id"],
        feeCategoryId: json["fee_category_id"],
        periodOfServiceId: json["period_of_service_id"],
        amount: json["amount"],
        batchId: json["batch_id"],
        feeSubTypeId: json["fee_sub_type_id"],
        feeSubcategoryId: json["fee_subcategory_id"],
      );

  Map<String, dynamic> toJson() => {
        "fee_type_id": feeTypeId,
        "fee_category_id": feeCategoryId,
        "period_of_service_id": periodOfServiceId,
        "amount": amount,
        "batch_id": batchId,
        "fee_sub_type_id": feeSubTypeId,
        "fee_subcategory_id": feeSubcategoryId,
      };
}

class Transport {
  int? amount;
  int? feeTypeId;
  int? feeSubTypeId;
  int? feeCategoryId;
  String? pickupPoint;
  List<VasStopDetail>? stopDetails;
  int? periodOfServiceId;

  Transport({
    this.amount,
    this.feeTypeId,
    this.feeSubTypeId,
    this.feeCategoryId,
    this.pickupPoint,
    this.stopDetails,
    this.periodOfServiceId,
  });

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        amount: json["amount"],
        feeTypeId: json["fee_type_id"],
        feeSubTypeId: json["fee_sub_type_id"],
        feeCategoryId: json["fee_category_id"],
        pickupPoint: json["pickup_point"],
        stopDetails: json["stop_details"] == null
            ? []
            : List<VasStopDetail>.from(
                json["stop_details"]!.map((x) => VasStopDetail.fromJson(x))),
        periodOfServiceId: json["period_of_service_id"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "fee_type_id": feeTypeId,
        "fee_sub_type_id": feeSubTypeId,
        "fee_category_id": feeCategoryId,
        "pickup_point": pickupPoint,
        "stop_details": stopDetails == null
            ? []
            : List<dynamic>.from(stopDetails!.map((x) => x.toJson())),
        "period_of_service_id": periodOfServiceId,
      };
}

class VasStopDetail {
  int? shiftId;
  int? stopId;
  String? routeId;

  VasStopDetail({
    this.shiftId,
    this.stopId,
    this.routeId,
  });

  factory VasStopDetail.fromJson(Map<String, dynamic> json) => VasStopDetail(
        shiftId: json["shift_id"],
        stopId: json["stop_id"],
        routeId: json["route_id"],
      );

  Map<String, dynamic> toJson() => {
        "shift_id": shiftId,
        "stop_id": stopId,
        "route_id": routeId,
      };
}
