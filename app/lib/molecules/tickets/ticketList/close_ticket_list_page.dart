// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/no_data_found_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets/app_images.dart';
import 'common_ticket_close_container.dart';

class CloseTicketListPage extends StatelessWidget {
  const CloseTicketListPage({
    super.key,
    required this.list,
  });

  final List<DataValue> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ?NoDataFoundWidget(title: 'No Closed tickets Available')
        : ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CommonTicketCloseContainer(
                showTextField: list[index].isReOpenedClicked,
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
