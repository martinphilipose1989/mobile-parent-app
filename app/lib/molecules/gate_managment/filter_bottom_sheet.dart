// // import 'package:app/feature/gate_management/visitor_list/visitor_list_page_viewmodel.dart';
// import 'package:app/model/resource.dart';
// import 'package:app/themes_setup.dart';
// import 'package:app/utils/app_typography.dart';
// import 'package:app/utils/common_outline_button.dart';
// import 'package:app/utils/common_primary_elevated_button.dart';
// import 'package:app/utils/stream_builder/app_stream_builder.dart';
// import 'package:app/utils/toggle_option_list.dart';
// import 'package:domain/domain.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FilterBottomSheet extends StatelessWidget {
//   const FilterBottomSheet({super.key, required this.model});
//
//   final VisitorListPageViewModel model;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Filter",
//                   style: AppTypography.subtitle1
//                       .copyWith(color: AppColors.textDark)),
//               IconButton(
//                   onPressed: () {
//                     if (!model.isFilterAppliedSubject.value) {
//                       model.resetFilter();
//                     }
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.close))
//             ],
//           ),
//           Divider(height: 16.h, color: AppColors.dividerColor),
//           const Text("Visitor Type"),
//           SizedBox(height: 16.h),
//           AppStreamBuilder<Resource<List<MdmCoReasonDataModel>>>(
//               stream: model.typeOfVisitorListStream,
//               initialData: Resource.none(),
//               dataBuilder: (context, data) {
//                 return ToggleOptionList<String>(
//                     selectedValue: model.selectedTypeOfVisitor,
//                     onSelect: (value) {
//                       model.setTypeofVistor(typeOfVisitorId: value);
//                       model.isButtonDisableSubject.add(false);
//                     },
//                     options: data?.data
//                             ?.map((e) => ToggleOption(
//                                 value: "${e.id}",
//                                 text: "${e.attributes?.name}"))
//                             .toList() ??
//                         []);
//               }),
//           SizedBox(height: 16.h),
//           const Text("Status"),
//           SizedBox(height: 16.h),
//           ToggleOptionList<String>(
//               onSelect: (value) {
//                 model.selectedVisitStatusFilter.add(value);
//                 model.isButtonDisableSubject.add(false);
//               },
//               selectedValue: model.selectedVisitStatusFilter,
//               options: model.statusTypeList),
//           SizedBox(height: 16.h),
//           Row(
//             children: [
//               Expanded(
//                   child: CommonOutlineButton(
//                       title: "Reset",
//                       onPressed: () {
//                         model.resetFilter();
//                         Navigator.pop(context);
//                       })),
//               SizedBox(width: 16.w),
//               Expanded(
//                 child: AppStreamBuilder<bool>(
//                     stream: model.isButtonDisableStream,
//                     initialData: model.isButtonDisableSubject.value,
//                     dataBuilder: (context, isButtonDisable) {
//                       return CommonPrimaryElevatedButton(
//                           isDisabled: isButtonDisable!,
//                           onPressed: () {
//                             model.applyFilters();
//                             Navigator.pop(context);
//                           },
//                           title: "Apply Filter");
//                     }),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
