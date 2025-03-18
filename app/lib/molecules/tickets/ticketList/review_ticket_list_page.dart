import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/common_widgets/app_images.dart';
//import '../../../utils/common_widgets/common_ticket_review_container.dart';
import 'common_ticket_review_container.dart';

class ReviewTicketListPage extends StatelessWidget {
  const ReviewTicketListPage({super.key, required this.list});
  final List<DataValue> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(
            child: CommonText(text: 'No Review tickets available'),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CommonTicketReviewContainer(
                showTextField: list[index].isMarkAsClosedCliked,
                index: index,
                id: list[index].id ?? "",
                communicationCount: list[index].communicationLogsCount ?? 0,
                ticketNo: list[index].ticketNumber ?? '',
                status: list[index].status,
                time: list[index].formattedDateAndTime ?? '',
                title: list[index].ticketTitle ?? '',
                subtitle: '',
                name: list[index].createdBy ?? '',
                statusIcon: AppImages.status_open,
              );
            });
  }
}
