import 'package:shared/src/model/response/enquiry_timeline/enquiry_timeline_detail.dart';
import 'package:shared/src/model/response/enquiry_timeline/enquiry_timeline_filter.dart';

class EnquiryTimelineData {
    TimeLineFilters? filters;
    List<EnquiryTimelineDetail>? timeline;

    EnquiryTimelineData({
        this.filters,
        this.timeline,
    });

}