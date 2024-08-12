class GetTokenGeneratorModel {
  final bool? success;
  final GetTokenGeneratorDataModel? data;
  final GetTokenGeneratorMetaModel? meta;
  final String? message;

  GetTokenGeneratorModel({
    this.success,
    this.data,
    this.meta,
    this.message,
  });
}

class GetTokenGeneratorDataModel {
  final String? number;
  final Details? details;

  GetTokenGeneratorDataModel({
    this.number,
    this.details,
  });
}

class Details {
  final GlobalNumberGenerator? globalNumberGenerator;
  final SegmentLobId? segmentLobId;

  Details({
    this.globalNumberGenerator,
    this.segmentLobId,
  });
}

class GlobalNumberGenerator {
  final int? id;
  final String? name;
  final String? prefix;
  final bool? isYear;
  final bool? isMonth;
  final bool? isDay;
  final bool? isLob;
  final dynamic isEntityId;
  final dynamic isSchoolCode;
  final int? nextNumber;
  final dynamic resetYearly;
  final int? numberOfDigit;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic lobId;
  final dynamic entitySegmentId;
  final dynamic schoolCodeId;

  GlobalNumberGenerator({
    this.id,
    this.name,
    this.prefix,
    this.isYear,
    this.isMonth,
    this.isDay,
    this.isLob,
    this.isEntityId,
    this.isSchoolCode,
    this.nextNumber,
    this.resetYearly,
    this.numberOfDigit,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.lobId,
    this.entitySegmentId,
    this.schoolCodeId,
  });
}

class SegmentLobId {
  final int? id;
  final int? segmentId;
  final dynamic createdAt;
  final DateTime? updatedAt;
  final int? parent1Id;
  final int? parent2Id;
  final int? parent3Id;
  final String? description;
  final dynamic startDate;
  final dynamic endDate;

  SegmentLobId({
    this.id,
    this.segmentId,
    this.createdAt,
    this.updatedAt,
    this.parent1Id,
    this.parent2Id,
    this.parent3Id,
    this.description,
    this.startDate,
    this.endDate,
  });
}

class GetTokenGeneratorMetaModel {
  GetTokenGeneratorMetaModel();
}
