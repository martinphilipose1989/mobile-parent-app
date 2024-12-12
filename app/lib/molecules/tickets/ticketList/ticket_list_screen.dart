// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tickets/ticket_list_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/tickets/ticketList/close_ticket_list_page.dart';
import 'package:app/molecules/tickets/ticketList/open_ticket_list_page.dart';
import 'package:app/molecules/tickets/ticketList/review_ticket_list_page.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart' as domian;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class TicketListScreen extends StatelessWidget {
  const TicketListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TicketListViewModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              SizedBox(height: 10.h, width: double.infinity),
              CommonTabPage(
                tabController: model!.tabController,
                selectedValue: model.selectedValue,
                moreThanTwoTab: true,
                showMiddleTab: true,
                onThirdTabChange: () {
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
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: AppStreamBuilder<int>(
                  stream: model.selectedValue,
                  initialData: model.selectedValue.value,
                  dataBuilder: (BuildContext context, int? tabvalue) {
                    return AppStreamBuilder<Resource<List<domian.DataValue>>>(
                      dataBuilder: (context, listData) {
                        return tabvalue == 0
                            ? OpenTicketListPage(
                                list: listData?.data
                                        ?.where(
                                          (e) => e.status == "open",
                                        )
                                        .toList() ??
                                    [])
                            : tabvalue == 1
                                ? ReviewTicketListPage(
                                    list: listData?.data
                                            ?.where(
                                              (e) => e.status != "closed",
                                            )
                                            .toList() ??
                                        [],
                                  )
                                : CloseTicketListPage(
                                    list: listData?.data
                                            ?.where(
                                              (e) => e.status == "closed",
                                            )
                                            .toList() ??
                                        []);
                      },
                      initialData: Resource.none(),
                      stream: model.getTicketStatusModel,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CommonElevatedButton(
                width: double.infinity,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.createTicketPage);
                },
                text: "Create New Ticket",
            textStyle: AppTypography.subtitle2.copyWith(color: Colors.black),

              )
            ],
          );
        },
        providerBase: ticketListProvider);
  }
}
