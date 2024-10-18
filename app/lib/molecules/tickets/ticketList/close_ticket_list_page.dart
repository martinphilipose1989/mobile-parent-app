
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../utils/common_widgets/app_images.dart';
import 'common_ticket_close_container.dart';

class CloseTicketListPage extends StatelessWidget {
  const CloseTicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
      return CommonTicketCloseContainer(ticketNo: 'abc', status: 'Close',
        time: '11:03 Am 12 july', title: 'Academic Related', subtitle: 'request for Progress Report', name: 'elvin nadar', statusIcon: AppImages.close,);

    });
  }
}
