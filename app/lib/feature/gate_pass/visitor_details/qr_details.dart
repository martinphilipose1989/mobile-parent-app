import 'dart:typed_data';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrDetailsPage extends StatelessWidget {
  final Uint8List qrImageBytes;

  const QrDetailsPage({super.key, required this.qrImageBytes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(appbarTitle: "Qr Code", showBackButton: true),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(
              qrImageBytes,
              fit: BoxFit.cover,
              height: 0.5.sw,
              width: 0.5.sw,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                    Icons.error); // Display an error icon or widget
              },
            )
          ],
        ),
      ),
    );
  }
}
