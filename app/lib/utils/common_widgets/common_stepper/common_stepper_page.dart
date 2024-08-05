import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_model.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonStepperPage extends StatelessWidget {
  final List<Step> stepperList;
  final int activeStep;
  const CommonStepperPage(
      {super.key, required this.stepperList, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommonStepperModel>(
        builder: (context, model, child) {
          return Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Stepper(
              physics: const NeverScrollableScrollPhysics(),
              connectorThickness: 4,
              margin: EdgeInsets.zero,
              elevation: 0,
              type: StepperType.vertical,
              currentStep: activeStep,
              controlsBuilder:
                  (BuildContext context, ControlsDetails controls) {
                return const Row(
                  children: <Widget>[
                    SizedBox.shrink(),
                  ],
                );
              },
              steps: stepperList,
            ),
          );
        },
        providerBase: commonStepperProvider);
  }
}
