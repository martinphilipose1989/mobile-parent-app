import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_view.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../enquiries/enquiries_page_model.dart';

class EnquiriesAdmissionsJourneyPage
    extends BasePage<EnquiriesAdmissionsJourneyViewModel> {
  final EnquiryDetailArgs? enquiryDetail;
  const EnquiriesAdmissionsJourneyPage({super.key, this.enquiryDetail});

  @override
  State<EnquiriesAdmissionsJourneyPage> createState() => _AdmissionsPageState();
}

class _AdmissionsPageState extends AppBasePageState<
    EnquiriesAdmissionsJourneyViewModel, EnquiriesAdmissionsJourneyPage> {
  late final EnquiriesPageModel enquiriesViewModel;
  @override
  void onModelReady(EnquiriesAdmissionsJourneyViewModel model) {
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  void initState() {
    super.initState();
    // Access the provider safely in initState or didChangeDependencies
    enquiriesViewModel = ProviderScope.containerOf(context, listen: false)
        .read(enquiriesPageModelProvider);
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesAdmissionsJourneyViewModel model) {
    return CommonAppBar(
        appbarTitle: 'Enquiry Details',
        notShowNotificationAndUserBatch: false,
        showBackButton: true,
        onBackPressed: () {
          //  enquiriesViewModel.fetchEnquiries();

          Navigator.pop(context);
        });
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget buildView(
      BuildContext context, EnquiriesAdmissionsJourneyViewModel model) {
    return EnquiriesAdmissionsJourneyPageView(
      provideBase(),
      enquiryDetail: widget.enquiryDetail ?? EnquiryDetailArgs(),
    );
  }

  @override
  ProviderBase<EnquiriesAdmissionsJourneyViewModel> provideBase() {
    return enquiriesAdmissionsJourneyProvider
        .call(widget.enquiryDetail ?? EnquiryDetailArgs());
  }

  @override
  Widget? buildFloatingButton(EnquiriesAdmissionsJourneyViewModel model) {
    return AppStreamBuilder<bool>(
      stream: model.showMenuOnFloatingButton,
      initialData: model.showMenuOnFloatingButton.value,
      dataBuilder: (context, data) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
              height: 65.h,
              width: 130.w,
              child: CommonElevatedButton(
                onPressed: () {
                  if (model.showMenuOnFloatingButton.value) {
                    model.showMenuOnFloatingButton.add(false);
                  } else {
                    model.showMenuOnFloatingButton.add(true);
                  }
                },
                text: data! ? 'Close' : 'Action',
                icon: data ? Icons.close : Icons.add,
                borderRadius: BorderRadius.circular(10),
                textColor: Theme.of(context).colorScheme.onTertiary,
                backgroundColor: AppColors.accent,
                textStyle: AppTypography.subtitle2
                    .copyWith(color: Theme.of(context).colorScheme.onTertiary),
              )),
        );
      },
    );
  }

  @override
  void dispose() {
    //  enquiriesViewModel.fetchEnquiries();
    super.dispose();
  }
}

class EnquiryDetailArgs {
  String? enquiryType;
  String? enquiryId;
  String? enquiryNumber;
  String? studentName;
  String? academicYear;
  String? school;
  String? board;
  String? grade;
  String? stream;
  String? shift;
  String? currentStage;
  String? schoolVisitDate;
  String? schoolVisitTime;
  int? formCompletionPercentage;
  String? isFrom;
  String? admissionStatus;
  String? status;
  String? brandName;
  int? schoolId;
  int? boardId;
  int? brandId;
  int? gradeId;
  int? academicYearId;
  int? courseId;
  int? shiftId;
  int? streamId;

  EnquiryDetailArgs(
      {this.enquiryId,
      this.enquiryNumber,
      this.enquiryType,
      this.currentStage,
      this.studentName,
      this.academicYear,
      this.school,
      this.board,
      this.grade,
      this.stream,
      this.shift,
      this.schoolVisitDate,
      this.schoolVisitTime,
      this.formCompletionPercentage,
      this.isFrom,
      this.admissionStatus,
      this.status,
      this.brandId,
      this.brandName,
      this.shiftId,
      this.streamId,
      this.schoolId,
      this.boardId,
      this.gradeId,
      this.academicYearId,
      this.courseId});

  @override
  String toString() {
    return 'EnquiryDetailArgs('
        'enquiryType: $enquiryType, '
        'enquiryId: $enquiryId, '
        'enquiryNumber: $enquiryNumber, '
        'studentName: $studentName, '
        'academicYear: $academicYear, '
        'school: $school, '
        'board: $board, '
        'grade: $grade, '
        'stream: $stream, '
        'shift: $shift, '
        'currentStage: $currentStage, '
        'schoolVisitDate: $schoolVisitDate, '
        'schoolVisitTime: $schoolVisitTime, '
        'formCompletionPercentage: $formCompletionPercentage, '
        'isFrom: $isFrom, '
        'admissionStatus: $admissionStatus, '
        'status: $status, '
        'brandName: $brandName, '
        'schoolId: $schoolId, '
        'boardId: $boardId, '
        'brandId: $brandId, '
        'gradeId: $gradeId, '
        'academicYearId: $academicYearId, '
        'courseId: $courseId,'
        'shiftId:  $shiftId.'
        'streamId: $streamId'
        ')';
  }
}
