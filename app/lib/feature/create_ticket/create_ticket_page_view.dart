import 'package:app/feature/create_ticket/create_ticket_view_model.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../themes_setup.dart';
import '../../utils/app_typography.dart';
import '../../utils/common_widgets/common_dropdown.dart';
import '../../utils/common_widgets/common_elevated_button.dart';
import '../../utils/common_widgets/common_text_widget.dart';
import '../tickets/ticket_list_view_model.dart';

class CreateTicketPageView extends BasePageViewWidget<CreateTicketViewModel> {
  final CreateTicketViewModel createTicketViewModel;
  CreateTicketPageView(super.providerBase, this.createTicketViewModel);

  @override
  Widget build(BuildContext context, CreateTicketViewModel model) {
    return Padding(
        padding:  EdgeInsets.all(16),
        child:
        Column(
          children: [
            SizedBox(
              height: 56.h,
              child: CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Category',
                hint: 'Select Category',
                showAstreik: true,
                showBorderColor: true,
                items: model.categoryTypes,
                onSingleSelect: (selectedValue) {
                },
                isMutiSelect: false,
              ),
            ),
            SizedBox(height: 24.h,),
            SizedBox(
              height: 56.h,
              child: CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Sub Category',
                hint: 'Select Sub Category',
                showAstreik: true,
                showBorderColor: true,
                items: model.subCategoryTypes,
                onSingleSelect: (selectedValue) {
                },
                isMutiSelect: false,
              ),
            ),
            SizedBox(height: 24.h,),
            Visibility(visible: false,
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
                    text: 'Now You Can Request/Check This From Menu > Fees > Payment Details ',
                    style: AppTypography.body2,
                  ),
                  SizedBox(height: 24.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    InkWell(child: Text("Go To Payment Details",
                      style: AppTypography.subtitle2.copyWith(color: Theme.of(context).colorScheme.primary),),)
                  ],)

                ],
              ),
            ),

      Visibility(
          visible: false,
          child: Column(children: [
            SizedBox(height: 10.h,),
        SizedBox(
          height: 56.h,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Class',
            hint: 'Select Class',
            showAstreik: true,
            showBorderColor: true,
            items: model.subCategoryTypes,
            onSingleSelect: (selectedValue) {
            },
            isMutiSelect: false,
          ),
        ),
            SizedBox(height: 24.h,),
        SizedBox(
          height: 56.h,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Bus issue',
            hint: 'Select Bus issue',
            showAstreik: true,
            showBorderColor: true,
            items: model.subCategoryTypes,
            onSingleSelect: (selectedValue) {
            },
            isMutiSelect: false,
          ),
        ),
        SizedBox(height: 24.h,),
        SizedBox(
          height: 56.h,
          child: CommonTextFormField(showAstreik: false,labelText: "Comments",hintText: "Add Comment...",)
        ),

      ],
          ),

      ),
      Expanded(
        child: Container(),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
            height: 40.h,
            width: 358.w,
            child: CommonElevatedButton(
              onPressed: () {},
              text: 'Submit',
             // icon: data ? Icons.close : Icons.add,
              borderRadius: BorderRadius.circular(10),
              textColor: Theme.of(context).colorScheme.onTertiary,
              backgroundColor: AppColors.accent,
              textStyle: AppTypography.subtitle2
                  .copyWith(color: Theme.of(context).colorScheme.onTertiary),
            )),
      ),
          ],
        )

    );
  }
}
