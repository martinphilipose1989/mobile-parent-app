import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingAmountExpansionTile extends StatefulWidget {
  PendingAmountExpansionTile({super.key});

  @override
  State<PendingAmountExpansionTile> createState() =>
      _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<PendingAmountExpansionTile> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: List.generate(
                  2,
                  (index) {
                    return Container(
                      width: 358.w,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1,
                          )),
                      child: ExpansionTile(
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          leading: Padding(
                            padding: EdgeInsets.zero,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: 'Consolidated',
                                    style: AppTypography.subtitle2.copyWith(),
                                  ),
                                  Text(
                                    'Installment 1',
                                    style: AppTypography.subtitle2.copyWith(),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: '₹ 70,000',
                                    style: AppTypography.subtitle2.copyWith(),
                                  ),
                                  Text(
                                    'Overdue By 1 Mo...',
                                    style: AppTypography.caption.copyWith(
                                        color: Theme.of(context)
                                            .textSelectionTheme
                                            .cursorColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Text(
                                    'Post School Activity Fees (PSA)\n'
                                    'Performing Arts\n'
                                    'Center Of Excellence\n'
                                    'Music (Guitar/Drums/Keyboard)',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Academic Year'),
                                      Text('2024 - 2025'),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Period Of Service'),
                                      Text('Quarter 1'),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Fees'),
                                      Text('₹ 1,20,000'),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Concession',
                                          style:
                                              TextStyle(color: Colors.green)),
                                      Text('-₹ 1,500',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Partially Paid',
                                          style:
                                              TextStyle(color: Colors.green)),
                                      Text('-₹ 48,000',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Reallocation (Transport)',
                                          style:
                                              TextStyle(color: Colors.green)),
                                      Text('-₹ 2,000',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Due Date'),
                                      Text('20/05/2024'),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                    );
                  },
                ),
              );
            }));
  }
}
