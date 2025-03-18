//import 'package:app/molecules/tracker/TicketList/TicketList_list.dart';

import 'package:app/feature/tickets/ticket_list_view_model.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../model/resource.dart';
import '../../molecules/tickets/ticketList/ticket_list_screen.dart';
import '../../utils/stream_builder/app_stream_builder.dart';

class TicketListPageView extends BasePageViewWidget<TicketListViewModel> {
  final TicketListViewModel ticketListViewModel;
  TicketListPageView(
    super.providerBase,
    this.ticketListViewModel,
  );

  @override
  Widget build(BuildContext context, TicketListViewModel model) {
    return AppStreamBuilder<Resource<List<DataValue>>>(
      stream: model.getTicketStatusModel,
      initialData: Resource.none(),
      onData: (value) {},
      dataBuilder: (context, data) {
        return data?.status == Status.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Padding(
                padding: EdgeInsets.all(16), child: TicketListScreen());
      },
    );
  }
}
