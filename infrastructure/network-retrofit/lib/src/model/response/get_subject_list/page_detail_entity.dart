import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PageDetailEntity extends BaseLayerDataTransformer<PageDetailEntity, PageDetail>{
  int? total;
  int? pageSize;
  int? numOfPages;

  PageDetailEntity({
    this.total,
    this.pageSize,
    this.numOfPages,
  });

  factory PageDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$PageDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PageDetailEntityToJson(this);

  @override
  PageDetail transform() {
    PageDetail pageDetail = PageDetail();
    pageDetail.total = total;
    pageDetail.pageSize = pageSize;
    pageDetail.numOfPages = numOfPages;
    return pageDetail;
  }
}