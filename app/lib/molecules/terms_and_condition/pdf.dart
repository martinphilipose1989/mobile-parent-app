import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_primary_elevated_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PDFDialog extends StatefulWidget {
  final String pdfUrl;
  final GetGuardianStudentDetailsStudentModel? selectedStudent;

  const PDFDialog(
      {super.key, required this.pdfUrl, required this.selectedStudent});

  @override
  PDFDialogState createState() => PDFDialogState();
}

class PDFDialogState extends State<PDFDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: BaseWidget(
          providerBase: pdfViewmodelProvider,
          onModelReady: (model) {
            model.downloadPdfFromUrl(downloadUrl: widget.pdfUrl);
          },
          builder: (context, model, _) {
            return Column(
              children: [
                // Dialog AppBar

                // PDF Viewer or Loading Indicator
                CommonSizedBox.sizedBox(height: 10, width: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Visibility(
                        visible:
                            widget.selectedStudent?.studentDisplayName != null,
                        child: Text(
                            "${widget.selectedStudent?.studentDisplayName?.split("-").first}"),
                      )
                    ],
                  ),
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                AppStreamBuilder<Resource<String>>(
                    stream: model!.localPath,
                    initialData: Resource.none(),
                    dataBuilder: (context, filePath) {
                      return Expanded(
                        child: filePath?.status == Status.loading
                            ? Center(child: CircularProgressIndicator())
                            : PDFView(
                                filePath: filePath?.data,
                                enableSwipe: true,
                                swipeHorizontal: false,
                                autoSpacing: true,
                                pageFling: true,
                                fitPolicy: FitPolicy.HEIGHT,
                                onLinkHandler: (uri) {
                                  log("URI $uri");
                                },
                              ),
                      );
                    }),
                // Accept Button

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppStreamBuilder<Resource<UndertakingResponse>>(
                      stream: model.underTakingSubject,
                      initialData: Resource.none(),
                      onData: (value) {
                        if (value.status == Status.success) {
                          ProviderScope.containerOf(context)
                              .read(dashboardViewModelProvider)
                              .getUserDetails();
                          Navigator.pop(context);
                        }
                      },
                      dataBuilder: (context, underTaking) {
                        return CommonPrimaryElevatedButton(
                          isLoading: underTaking?.status == Status.loading,
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.primaryOn,
                          onPressed: () {
                            // Handle accept action here
                            model.studentUnderTaking(
                                studentYearlyId:
                                    widget.selectedStudent!.studentYearlyId!);
                          },
                          title: "Accept Terms and Conditions",
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
