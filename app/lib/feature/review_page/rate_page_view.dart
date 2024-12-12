import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/review_page/rate_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class RatePageView extends BasePageViewWidget<RatePageModel> {
  RatePageView(super.providerBase);

  @override
  Widget build(BuildContext context, RatePageModel model) {
    return AppStreamBuilder<int>(
      stream: model.selectedRatingValue,
      initialData: model.selectedRatingValue.value,
      dataBuilder: (context, data) {
        return AppStreamBuilder<Resource<SendCommunicationModel>>(
          stream: model.sendCommunicationModelStream,
          initialData: Resource.none(),
          onData: (value) {
            if (value.status == Status.success) {
              ProviderScope.containerOf(context)
                  .read(ticketListProvider)
                  .getTicketStatus();
              Navigator.popUntil(
                  context, ModalRoute.withName(RoutePaths.ticketListPage));
            }
          },
          dataBuilder: (context, communicationData) {
            return communicationData!.status == Status.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SvgPicture.asset(width: MediaQuery.of(context).size.width,
                            data! == 0
                                ? AppImages.rate1
                                : data == 1
                                    ? AppImages.rate2
                                    : data == 2
                                        ? AppImages.rate3
                                        : data == 3
                                            ? AppImages.rate4
                                            : AppImages.rate5,
                            fit: BoxFit.cover,
                          ),
                          CommonSizedBox.sizedBox(height: 20, width: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                            mainAxisAlignment:   ResponsiveBreakpoints.of(context).isMobile
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () => model.updateRatingValue(0),
                                  child: SvgPicture.asset(
                                    data == 0
                                        ? AppImages.ratingActive1
                                        : AppImages.ratingDeactive1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => model.updateRatingValue(1),
                                  child: SvgPicture.asset(
                                    data == 1
                                        ? AppImages.ratingActive2
                                        : AppImages.ratingDeactive2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => model.updateRatingValue(2),
                                  child: SvgPicture.asset(
                                    data == 2
                                        ? AppImages.ratingActive3
                                        : AppImages.ratingDeactive3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => model.updateRatingValue(3),
                                  child: SvgPicture.asset(
                                    data == 3
                                        ? AppImages.ratingActive4
                                        : AppImages.ratingDeactive4,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => model.updateRatingValue(4),
                                  child: SvgPicture.asset(
                                    data == 4
                                        ? AppImages.ratingActive5
                                        : AppImages.ratingDeactive5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTextFormField(
                              controller: model.commentController,
                              showAstreik: false,
                              labelText: "Comments",
                            ),
                          ),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                        ],
                      ),
                    ));
          },
        );
      },
    );
  }
}
