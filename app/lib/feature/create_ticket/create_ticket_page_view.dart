import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/create_ticket/create_ticket_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../utils/app_typography.dart';
import '../../utils/common_widgets/common_dropdown.dart';
import '../../utils/common_widgets/common_elevated_button.dart';
import '../../utils/common_widgets/common_text_widget.dart';

class CreateTicketPageView extends BasePageViewWidget<CreateTicketViewModel> {
  final CreateTicketViewModel createTicketViewModel;
  CreateTicketPageView(super.providerBase, this.createTicketViewModel);

  @override
  Widget build(BuildContext context, CreateTicketViewModel model) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppStreamBuilder<Resource<List<MsgCategoryModelDatum>>>(
                stream: model.getCategoryModelResponseStream,
                initialData: Resource.none(),
                dataBuilder: (context, data) {
                  return SizedBox(
                    height: 58.h,
                    child: CustomDropdownButton(
                      width: MediaQuery.of(context).size.width,
                      onMultiSelect: (selectedValues) {},
                      dropdownName: 'Category',
                      hint: 'Select Category',
                      showAstreik: true,
                      showBorderColor: true,
                      items:
                          data?.data?.map((e) => e.attributes!.name).toList() ??
                              [], //model.categoryTypes
                      onSingleSelect: (selectedValue) {
                        model.getCategorId(selectedValue);
                      },
                      isMutiSelect: false,
                    ),
                  );
                }),
            SizedBox(
              height: 24.h,
            ),
            AppStreamBuilder<Resource<List<MsgSubCategoryDatumModel>>>(
                stream: model.getSubCategoryModelResponseStream,
                initialData: Resource.none(),
                dataBuilder: (context, data) {
                  return SizedBox(
                    height: 58.h,
                    child: CustomDropdownButton(
                      width: MediaQuery.of(context).size.width,
                      onMultiSelect: (selectedValues) {},
                      dropdownName: 'Sub Category',
                      hint: 'Select Sub Category',
                      showAstreik: true,
                      showBorderColor: true,
                      items:
                          data!.data?.map((e) => e.attributes.name).toList() ??
                              [], //model.subCategoryTypes,
                      onSingleSelect: (selectedValue) {
                        model.getSubCategoryId(selectedValue);
                      },
                      isMutiSelect: false,
                    ),
                  );
                }),
            SizedBox(
              height: 24.h,
            ),
            AppStreamBuilder<Resource<FindByCategorySubCategoryModel>>(
              stream: model.findByCatSubCategoryResponseStream,
              initialData: Resource.none(),
              dataBuilder: (context, findByCatSubCategoryResponseData) {
                return Column(
                  children: [
                    Visibility(
                      visible: (findByCatSubCategoryResponseData!.data?.data?[0]
                                  .navigationInstruction?.isNotEmpty ??
                              false) &&
                          (findByCatSubCategoryResponseData
                                  .data?.data?[0].navigationLink?.isNotEmpty ??
                              false),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              CommonText(
                                text: 'Instructions',
                                style: AppTypography.subtitle2,
                              ),
                            ],
                          ),
                          const CommonText(
                            text:
                                'Now You Can Request/Check This From Menu > Fees > Payment Details ',
                            style: AppTypography.body2,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Text(
                                  "Go To Payment Details",
                                  style: AppTypography.subtitle2.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (findByCatSubCategoryResponseData.data?.data?[0]
                                  .navigationInstruction?.isEmpty ??
                              false) &&
                          (findByCatSubCategoryResponseData
                                  .data?.data?[0].navigationLink?.isEmpty ??
                              false),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 56.h,
                              child: CommonTextFormField(
                                showAstreik: true,
                                controller: model.subjectController,
                                labelText: "Subject",
                              )),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                              height: 56.h,
                              child: CommonTextFormField(
                                controller: model.responseController,
                                showAstreik: true,
                                labelText: "Response",
                              )),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                              height: 56.h,
                              child: CommonTextFormField(
                                showAstreik: false,
                                controller: model.commentController,
                                labelText: "Comments",
                                hintText: "Add Comment...",
                              )),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: Container(),
            ),
            AppStreamBuilder<bool>(
              stream: model.submitIsClickable,
              initialData: model.submitIsClickable.value,
              dataBuilder: (context, boolData) {
                return AppStreamBuilder<Resource<CreateTicketModel>>(
                  stream: model.createTicketModelStream,
                  initialData: Resource.none(),
                  onData: (value) {
                    if (value.status == Status.success) {
                      ProviderScope.containerOf(context)
                          .read(ticketListProvider)
                          .getTicketStatus();
                      Navigator.popUntil(context,
                          ModalRoute.withName(RoutePaths.ticketListPage));
                    }
                  },
                  dataBuilder: (context, createTicketData) {
                    return createTicketData!.status == Status.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                height: 40.h,
                                width: 358.w,
                                child: CommonElevatedButton(
                                  onPressed: boolData! == true
                                      ? () {
                                          model.createticket();
                                        }
                                      : () {},
                                  text: 'Submit',
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: boolData == true
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                  textStyle: AppTypography.subtitle2.copyWith(
                                      color: boolData == true
                                          ? Colors.black
                                          : Theme.of(context)
                                              .colorScheme
                                              .primaryContainer),
                                )),
                          );
                  },
                );
              },
            )
          ],
        ));
  }
}
