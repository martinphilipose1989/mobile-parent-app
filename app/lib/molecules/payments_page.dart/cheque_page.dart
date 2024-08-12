import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

import '../../utils/common_widgets/common_textformfield_widget.dart';

class Chequepage extends StatefulWidget {
  const Chequepage({
    super.key,
    required this.pageModel,
  });

  final PaymentsPageModel pageModel;

  @override
  State<Chequepage> createState() => _ChequepageState();
}

class _ChequepageState extends State<Chequepage> {
  PaymentsPageModel? pageModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageModel = widget.pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appbarTitle: 'Cheque Page',
        notShowNotificationAndUserBatch: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          CommonSizedBox.sizedBox(height: 20, width: 10),
          CommonTextFormField(
            showAstreik: true,
            labelText: 'Payment Type',
            controller: pageModel!.payemntType,
            readOnly: true,
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          CommonTextFormField(
            showAstreik: true,
            labelText: 'In Favour',
            controller: pageModel!.inFavour,
            readOnly: true,
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          CommonTextFormField(
            showAstreik: true,
            labelText: 'Amount',
            controller: pageModel!.amount,
            readOnly: true,
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const Divider(
            height: 10,
            thickness: 1,
            color: AppColors.textPaleGray,
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          // SizedBox(
          //     height: 200,
          //     child: Column(
          //       children: List.generate(
          //         1,
          //         (index) {
          //           return Column(
          //             children: [
          //               CustomDropdownButton(
          //                 onMultiSelect: (selectedValues) {},
          //                 onSingleSelect: (selectedValue) {
          //                   if (widget.pageModel.chequeTypes
          //                       .contains(selectedValue)) {
          //                     widget.pageModel.selectedChequeType.add(true);
          //                   }
          //                 },
          //                 isMutiSelect: false,
          //                 width: MediaQuery.of(context).size.width,
          //                 items: widget.pageModel.chequeTypes,
          //                 showAstreik: true,
          //                 showBorderColor: true,
          //                 dropdownName: 'Cheque Type',
          //               ),
          //               CommonSizedBox.sizedBox(height: 20, width: 10),
          //               SizedBox(
          //                 height: 1.sp,
          //                 child: Column(
          //                   children: List.generate(
          //                     1,
          //                     (index) {
          //                       return Column(
          //                         children: [
          //                           CommonSizedBox.sizedBox(
          //                               height: 20, width: 10),
          //                           const CommonTextFormField(
          //                             showAstreik: true,
          //                             labelText: 'Cheque Number',
          //                           ),
          //                           CommonSizedBox.sizedBox(
          //                               height: 20, width: 10),
          //                           const CommonTextFormField(
          //                             showAstreik: true,
          //                             labelText: 'Cheque Date',
          //                           ),
          //                           CommonSizedBox.sizedBox(
          //                               height: 20, width: 10),
          //                           const CommonTextFormField(
          //                             showAstreik: true,
          //                             labelText: 'IFSC Code',
          //                           ),
          //                           CommonSizedBox.sizedBox(
          //                               height: 20, width: 10),
          //                           const CommonTextFormField(
          //                             showAstreik: true,
          //                             labelText: 'Issue Name',
          //                           ),
          //                           CommonSizedBox.sizedBox(
          //                               height: 20, width: 10),
          //                           const CommonTextFormField(
          //                             showAstreik: true,
          //                             labelText: 'Amount',
          //                           ),
          //                         ],
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               )
          //             ],
          //           );
          //         },
          //       ),
          //     )),

          // AppStreamBuilder<bool>(
          //   stream: widget.pageModel.selectedChequeType,
          //   initialData: widget.pageModel.selectedChequeType.value,
          //   dataBuilder: (context, data) {
          //     return (data ?? false)
          //         ? AppStreamBuilder<int>(
          //             stream: widget.pageModel.noOfCheques,
          //             initialData: widget.pageModel.noOfCheques.value,
          //             dataBuilder: (context, data) {
          //               return Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: List.generate(
          //                       widget.pageModel.noOfCheques.value,
          //                       (index) {
          //                         return Column(
          //                           children: [
          //                             CommonSizedBox.sizedBox(
          //                                 height: 20, width: 10),
          //                             CustomDropdownButton(
          //                               onMultiSelect: (selectedValues) {},
          //                               onSingleSelect: (selectedValue) {
          //                                 if (widget.pageModel.chequeTypes
          //                                     .contains(selectedValue)) {
          //                                   widget.pageModel.selectedChequeType
          //                                       .add(true);
          //                                 }
          //                               },
          //                               isMutiSelect: false,
          //                               width:
          //                                   MediaQuery.of(context).size.width,
          //                               items: widget.pageModel.chequeTypes,
          //                               showAstreik: true,
          //                               showBorderColor: true,
          //                               dropdownName: 'Cheque Type',
          //                             ),
          //                             CommonSizedBox.sizedBox(
          //                                 height: 20, width: 10),
          //                             const CommonTextFormField(
          //                               showAstreik: false,
          //                               labelText: 'Token Number',
          //                             ),
          //                             CommonSizedBox.sizedBox(
          //                                 height: 20, width: 10),
          //                             CustomDropdownButton(
          //                               onMultiSelect: (selectedValues) {},
          //                               isMutiSelect: true,
          //                               width:
          //                                   MediaQuery.of(context).size.width,
          //                               items: widget.pageModel.feesType,
          //                               showAstreik: true,
          //                               showBorderColor: true,
          //                               dropdownName: 'Fees Type',
          //                             ),
          //                             Align(
          //                               alignment: Alignment.centerRight,
          //                               child: index != 0
          //                                   ? Column(
          //                                       children: [
          //                                         CommonSizedBox.sizedBox(
          //                                             height: 20, width: 10),
          //                                         InkWell(
          //                                           onTap: () {
          //                                             widget
          //                                                 .pageModel.noOfCheques
          //                                                 .add(data! - 1);
          //                                           },
          //                                           child: const Icon(
          //                                             Icons.delete_outlined,
          //                                             color: AppColors.failure,
          //                                           ),
          //                                         ),
          //                                       ],
          //                                     )
          //                                   : const SizedBox.shrink(),
          //                             ),
          // CommonSizedBox.sizedBox(
          //     height: 20, width: 10),
          // const CommonTextFormField(
          //   showAstreik: true,
          //   labelText: 'Cheque Number',
          // ),
          // CommonSizedBox.sizedBox(
          //     height: 20, width: 10),
          // const CommonTextFormField(
          //   showAstreik: true,
          //   labelText: 'Cheque Date',
          // ),
          // CommonSizedBox.sizedBox(
          //     height: 20, width: 10),
          // const CommonTextFormField(
          //   showAstreik: true,
          //   labelText: 'IFSC Code',
          // ),
          // CommonSizedBox.sizedBox(
          //     height: 20, width: 10),
          // const CommonTextFormField(
          //   showAstreik: true,
          //   labelText: 'Issue Name',
          // ),
          // CommonSizedBox.sizedBox(
          //     height: 20, width: 10),
          // const CommonTextFormField(
          //   showAstreik: true,
          //   labelText: 'Amount',
          // ),
          //                           ],
          //                         );
          //                       },
          //                     ),
          //                   ),
          //                   CommonSizedBox.sizedBox(height: 20, width: 10),
          //                   InkWell(
          //                     onTap: () {
          //                       widget.pageModel.noOfCheques.add(data! + 1);
          //                     },
          //                     child: CommonText(
          //                       text: '+Add Another Cheque',
          //                       style: AppTypography.subtitle2.copyWith(
          //                           color:
          //                               Theme.of(context).colorScheme.primary),
          //                     ),
          //                   )
          //                 ],
          //               );
          //             },
          //           )
          //         : const SizedBox.shrink();
          //   },
          // ),
          AppStreamBuilder<Resource<domain.GetStorePaymentModel>>(
            stream: pageModel!.getStorePaymentModel,
            initialData: Resource.none(),
            onData: (value) {
              if (value.status == Status.success) {
                CommonPopups().showSuccess(
                  context,
                  'Payment\nSuccessfull!',
                  (shouldRoute) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutePaths.payments, ModalRoute.withName('/'));
                  },
                );
              }
            },
            dataBuilder: (context, data) {
              return data!.status == Status.loading
                  ? const SizedBox(
                      width: 100,
                      child: CircularProgressIndicator(),
                    )
                  : CommonElevatedButton(
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        pageModel!.storeFeepayment();
                      },
                      text: 'Continue',
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      textStyle: AppTypography.subtitle2.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary),
                    );
            },
          )
        ]),
      ),
    );
  }
}
