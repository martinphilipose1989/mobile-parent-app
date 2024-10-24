// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/molecules/tickets/ticketList/common_ticket_container.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets/app_images.dart';

class OpenTicketListPage extends StatelessWidget {
  const OpenTicketListPage({
    super.key,
    required this.list,
  });

  final List<DataValue> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(
            child: CommonText(text: 'No Open tickets available'),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CommonTicketContainer(
                id: list[index].id ?? '',
                communicationCount: list[index].communicationLogsCount,
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
