import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'bus_route_list_page_pageview.dart';
import 'bus_route_list_page_viewmodel.dart';

class BusRouteListPage extends BasePage<BusRouteListPageViewModel> {
  final TripResultArgs? tripArgs;

  const BusRouteListPage({super.key, required this.tripArgs});

  @override
  BusChecklistPageState createState() => BusChecklistPageState();
}

class BusChecklistPageState
    extends AppBasePageState<BusRouteListPageViewModel, BusRouteListPage> {
  @override
  Widget buildView(BuildContext context, BusRouteListPageViewModel model) {
    return BusRouteListPageView(provideBase());
  }

  @override
  ProviderBase<BusRouteListPageViewModel> provideBase() {
    return busRouteListPageViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(BusRouteListPageViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.trip = widget.tripArgs?.tripResult;
    model.getBusStopsList();
    if (model.dashBoardState.selectedStudent != null) {
      model.getStudentAttendance();
    }

    // model.trackLiveLocation();

    // model.timer = Timer.periodic(
    //     const Duration(minutes: 5), (timer) => model.getUserLoacation());
  }

  @override
  PreferredSizeWidget? buildAppbar(BusRouteListPageViewModel model) {
    return const CommonAppBar(
      showBackButton: true,
      appbarTitle: "Track Bus",
    );
  }
}

class TripResultArgs {
  TripResult? tripResult;

  TripResultArgs({this.tripResult});
}
