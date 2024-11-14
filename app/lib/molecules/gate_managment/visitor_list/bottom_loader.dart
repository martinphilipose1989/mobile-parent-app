import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';

class VisitorBottomLoader extends StatelessWidget {
  const VisitorBottomLoader({super.key, required this.loadingStream});

  final Stream<bool> loadingStream;

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<bool>(
      stream: loadingStream,
      initialData: false,
      dataBuilder: (context, isLoading) {
        return isLoading == true
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: CircularProgressIndicator()),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
