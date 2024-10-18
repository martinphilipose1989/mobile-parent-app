import 'package:app/feature/tickets/ticket_list_view_model.dart';
import 'package:app/molecules/tickets/ticketList/close_ticket_list_page.dart';
import 'package:app/molecules/tickets/ticketList/open_ticket_list_page.dart';
import 'package:app/molecules/tickets/ticketList/review_ticket_list_page.dart';
import 'package:app/navigation/route_paths.dart';


import 'package:app/utils/common_widgets/common_elevated_button.dart';

import 'package:app/utils/common_widgets/common_tab_page.dart';

import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketListScreen extends StatefulWidget {
  TicketListViewModel ticketListViewModel;
 TicketListScreen({super.key,required this.ticketListViewModel});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
     SizedBox(height: 10.h, width: double.infinity),
        CommonTabPage (
          tabController: widget.ticketListViewModel.tabController,
        selectedValue: widget.ticketListViewModel.selectedValue,

moreThanTwoTab: true,
          showMiddleTab: true,
          onThirdTabChange:(){
            FocusScope.of(context).unfocus();
          },
          firstTabTitle: 'Open',
          secondTabTitle: 'Reviewed',
          thirdTabTitle: 'Closed',
          onFirstTabChange: () {
            FocusScope.of(context).unfocus();

          },
          onSecondTabChange: () {
            FocusScope.of(context).unfocus();

          },


        ),

        SizedBox(height: 10.h,),
 Expanded(
   child: AppStreamBuilder(
    
        stream: widget.ticketListViewModel.selectedValue,
      initialData: widget.ticketListViewModel.selectedValue.value,
      dataBuilder: (BuildContext context, int? data) {
    
          return
            data == 0?
           const
    

      OpenTicketListPage(): data == 1?const ReviewTicketListPage():const CloseTicketListPage();
          },),
 ),
SizedBox(height: 10.h,),
        CommonElevatedButton(width:double.infinity,backgroundColor:Theme.of(context).colorScheme.secondary,onPressed: (){

          Navigator.pushNamed(context, RoutePaths.createTicketPage);

        }, text: "Create New Ticket",)
      ],
    );
  }
}
