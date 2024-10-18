import 'package:flutter/cupertino.dart';

import '../../../utils/common_widgets/app_images.dart';
//import '../../../utils/common_widgets/common_ticket_review_container.dart';
import 'common_ticket_review_container.dart';

class ReviewTicketListPage extends StatelessWidget {
  const ReviewTicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
          return CommonTicketReviewContainer(ticketNo: 'abc', status: 'open',
            time: '11:03 Am 12 july 2024', title: 'Academic Related', subtitle: 'request for Progress Report', name: 'elvin nadar', statusIcon: AppImages.status_open,);

        });
  }
}

