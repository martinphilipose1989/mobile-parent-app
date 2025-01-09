import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/new_enrolment/new_enrolment_viewmodel.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_page.dart';
import 'package:app/feature/vas/kids_club/kids_club_page.dart';
import 'package:app/feature/vas/psa/psa_page.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_page.dart';
import 'package:app/feature/vas/transport/transport_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/attendance/attandance_details/student_details.dart'
    as student;
import 'package:app/navigation/route_paths.dart';

import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/toggle_option_list.dart';

import 'package:app/utils/enums/new_enrolment_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/string_extension.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class NewEnrolmentPageView extends BasePageViewWidget<NewEnrolmentViewModel> {
  // ignore: use_super_parameters
  NewEnrolmentPageView(ProviderBase<NewEnrolmentViewModel> model)
      : super(model);

  @override
  Widget build(BuildContext context, NewEnrolmentViewModel model) {
    return AppStreamBuilder<Resource<NewEnrolmentResponse>>(
        stream: model.newEnrolmentSubject,
        initialData: Resource.none(),
        onData: (value) {
          if (value.status == Status.success) {
            // model.newEnrolmentSubject.add(Resource.none());
            CommonPopups().showSuccess(context, "Student Enrolment Successful",
                (val) {
              Navigator.of(context)
                  .popUntil(ModalRoute.withName(RoutePaths.tabbar));
            });
          }
        },
        dataBuilder: (context, newEnrolmentResponse) {
          return Stack(
            children: [
              Column(
                children: [
                  AppStreamBuilder<Resource<StudentData>>(
                      stream: model.studentProfileSubject,
                      initialData: Resource.none(),
                      dataBuilder: (context, studentResponse) {
                        final studentProfile = studentResponse?.data?.profile;
                        return studentResponse?.status == Status.loading
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: studentProfile != null
                                    ? student.StudentDetails(
                                        image: studentProfile.profileImageUrl,
                                        name:
                                            "${studentProfile.firstName?.orEmpty('N/A') ?? ''} ${studentProfile.lastName?.orEmpty('N/A')}",
                                        title:
                                            "${studentProfile.crtSchool?.orEmpty('N/A')}|${studentProfile.crtBoard?.orEmpty('N/A')}",
                                        subtitle:
                                            "${studentProfile.courseName?.orEmpty('N/A')}| ${studentProfile.crtShift.orEmpty('N/A')}| ${studentProfile.crtDivision.orEmpty('N/A')}| ${studentProfile.crtHouse.orEmpty('N/A')} | ${studentProfile.crtGrade.orEmpty('N/A')}",
                                        subtitle2:
                                            "Stream: ${studentProfile.streamName.orEmpty('N/A')}")
                                    : Text("No Data"),
                              );
                      }),
                  Padding(
                    padding: REdgeInsets.all(16.0),
                    child: ToggleOptionList<VasOptions>(
                        disableWrap: true,
                        selectedValue: model.selectedVasOption,
                        options: model.vasOptions,
                        onSelect: (value) => {}),
                  ),
                  AppStreamBuilder<Resource<StudentData>>(
                      stream: model.studentProfileSubject,
                      initialData: Resource.none(),
                      dataBuilder: (context, data) {
                        return Visibility(
                          visible: data?.data?.profile != null &&
                              data?.data?.profile?.crtSchoolId != null,
                          child: Expanded(
                            child: StreamBuilder<VasOptions>(
                              stream: model.selectedVasOption,
                              initialData: VasOptions.kidsClub,
                              builder: (context, snapshot) {
                                final vasOption =
                                    snapshot.data ?? VasOptions.kidsClub;

                                return IndexedStack(
                                  index: VasOptions.values.indexOf(vasOption),
                                  children: VasOptions.values.map((option) {
                                    return Visibility(
                                      visible: vasOption == option,
                                      maintainState:
                                          true, // Retain state when not visible
                                      child: _getPageForOption(option, model),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                ],
              ),
              if (newEnrolmentResponse?.status == Status.loading)
                CommonAppLoader()
            ],
          );
        });
  }

  Widget _getPageForOption(VasOptions option, NewEnrolmentViewModel model) {
    final profile = model.studentProfileSubject.value.data?.profile;

    final enquiryDetailArgs = EnquiryDetailArgs(
        schoolId: profile?.crtSchoolId,
        boardId: profile?.crtBoardId,
        academicYearId: profile?.academicYearId,
        courseId: profile?.crtCourseId,
        streamId: profile?.crtStreamId,
        gradeId: profile?.crtGradeId,
        shiftId: profile?.crtShiftId,
        studentId: profile?.id,
        studentGlobalId: profile?.globalId,
        brandId: profile?.crtBrandId,
        enquiryNumber: profile?.crtEnrOn);

    switch (option) {
      case VasOptions.kidsClub:
        return KidsClubDeatilDetailPage(
            hideAppBar: true,
            enquiryDetailArgs: enquiryDetailArgs,
            onSelectVasEnrolment: (studentFee) {
              model.createNewEnrolment(studentFees: [studentFee]);
            });
      case VasOptions.cafeteria:
        return CafeteriaPage(
            hideAppBar: true,
            enquiryDetailArgs: enquiryDetailArgs,
            onSelectVasEnrolment: (studentFee) {
              model.createNewEnrolment(studentFees: [studentFee]);
            });
      // case VasOptions.psa:
      //   return PsaDetailPage(
      //       hideAppBar: true,
      //       enquiryDetailArgs: enquiryDetailArgs,
      //       onSelectVasEnrolment: (studentFee) {
      //         model.createNewEnrolment(studentFees: [studentFee]);
      //       });
      // case VasOptions.summerCamp:
      //   return SummerCampDetailPage(
      //       hideAppBar: true,
      //       enquiryDetailArgs: enquiryDetailArgs,
      //       onSelectVasEnrolment: (studentFee) {
      //         model.createNewEnrolment(studentFees: [studentFee]);
      //       });
      case VasOptions.transport:
        return TransportPage(
            hideAppBar: true,
            enquiryDetailArgs: enquiryDetailArgs,
            onSelectVasEnrolment: (studentFee) {
              model.createNewEnrolment(studentFees: [studentFee]);
            });
      default:
        return SizedBox.shrink();
    }
  }
}
