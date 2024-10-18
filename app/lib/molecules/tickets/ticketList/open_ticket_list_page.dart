import 'package:app/molecules/tickets/ticketList/common_ticket_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../utils/common_widgets/app_images.dart';

class OpenTicketListPage extends StatelessWidget {
  const OpenTicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
      return CommonTicketContainer(ticketNo: 'abc', status: 'open',
        time: '11:03 Am 12 july', title: 'Academic Related', subtitle: 'request for Progress Report', name: 'elvin nadar', statusIcon: AppImages.status_open,);

    });
  }
}
