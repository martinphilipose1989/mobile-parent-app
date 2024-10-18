//import 'package:app/molecules/tracker/TicketList/TicketList_list.dart';
import 'package:app/feature/tickets/ticket_list_view_model.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../../molecules/attendance/attendance_calender/attendance_calender.dart';
import '../../molecules/tickets/ticketList/ticket_list_screen.dart';

class TicketListPageView extends BasePageViewWidget {
  final TicketListViewModel ticketListViewModel;
  TicketListPageView(super.providerBase, this.ticketListViewModel);

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding:  EdgeInsets.all(16),
      child:
         TicketListScreen(ticketListViewModel: ticketListViewModel,)

    );
  }
}
