import 'package:shared/src/model/response/enquiry_timeline/enquiry_timeline_data.dart';

class EnquiryTimeLineBase {
    int? status;
    EnquiryTimelineData? data;
    String? message;

    EnquiryTimeLineBase({
        this.status,
        this.data,
        this.message,
    });

}