import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cheque_page/cheque_page_view.dart';
import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/molecules/cheque_page/fee_type_list.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ChequePage extends BasePage<ChequePageModel> {
  final PaymentsPageModel paymentsPageModel;
  const ChequePage({super.key, required this.paymentsPageModel});

  @override
  ChequePageState createState() => ChequePageState();
}

class ChequePageState extends AppBasePageState<ChequePageModel, ChequePage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<ChequePageModel> provideBase() {
    return chequePageModelProvider;
  }

  @override
  void onModelReady(ChequePageModel model) {
    model.amount = widget.paymentsPageModel.amount;
    model.inFavour = widget.paymentsPageModel.inFavour;
    model.payemntType = widget.paymentsPageModel.payemntType;
    model.chequeInFavourId = widget.paymentsPageModel.chequeInFavourId;
    model.paymentsPageModel = widget.paymentsPageModel;
    model.selectedPendingFessList = ProviderScope.containerOf(context)
        .read(paymentsModelProvider)
        .selectedPendingFessList;
    model.customerName = widget.paymentsPageModel.customerName;
    model.customerIfscCode = widget.paymentsPageModel.customerIfscCode;
    model.phoneNo = widget.paymentsPageModel.phoneNo;
    model.feesType = model.selectedPendingFessList
        .map((e) =>
            FeeTypeList(id: e.id ?? 0, name: e.feeDisplayName, selected: false))
        .toList();
    // FOR REDIRECTION AFTER PAYMENT SUCCESS
    model.modules = widget.paymentsPageModel.modules;
  }

  @override
  Widget buildView(BuildContext context, ChequePageModel model) {
    return ChequePageView(provideBase());
  }

  @override
  Widget? buildBottomSheet(ChequePageModel model) {
    // TODO: implement buildBottomSheet
    return AppStreamBuilder<bool>(
      stream: model.showCameraAndGalleryBottomsheet,
      initialData: model.showCameraAndGalleryBottomsheet.value,
      dataBuilder: (context, data) {
        return data!
            ? Container(
                height: 150,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            model.showCameraAndGalleryBottomsheet.add(false);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          bool cameraPermissionGranted = await model
                              .permissionHandler
                              .checkCameraPermission(
                            (value) {
                              if (value) {
                                CommonPopups().showGallerySettingPermission(
                                  context,
                                  'To continue, please allow access to your camera. These permissions are necessary for capturing and selecting images. You can enable them in your device settings.',
                                  true,
                                  Icons.camera_alt,
                                  (shouldRoute) {
                                    openAppSettings();
                                  },
                                );
                              }
                            },
                          );
                          if (cameraPermissionGranted) {
                            model.pickImage(UpoladFileTypeEnum.camera,
                                model.selectedIndexForChequeImage ?? 0);
                          }
                        },
                        child: const CommonText(text: "Take A Photo"),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () async {
                          bool galleryPermissionGranted = await model
                              .permissionHandler
                              .checkGalleryPermission(
                            (value) {
                              if (value) {
                                CommonPopups().showGallerySettingPermission(
                                  context,
                                  'To continue, please allow access to your gallery. These permissions are necessary for capturing and selecting images. You can enable them in your device settings.',
                                  true,
                                  Icons.photo,
                                  (shouldRoute) {
                                    openAppSettings();
                                  },
                                );
                              }
                            },
                          );
                          if (galleryPermissionGranted) {
                            model.pickImage(UpoladFileTypeEnum.image,
                                model.selectedIndexForChequeImage ?? 0);
                          }
                        },
                        child: const CommonText(text: "Choose From Gallery"),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(ChequePageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Cheque Details',
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
