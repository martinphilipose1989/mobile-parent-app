import 'package:cached_network_image/cached_network_image.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/material.dart';

class CommonImageWidget extends StatelessWidget {
  const CommonImageWidget(
      {super.key,
      required this.imageUrl,
      this.assetImageBoxFit = BoxFit.cover,
      this.networkImageBoxFit = BoxFit.cover,
      this.fallbackAssetImagePath = AppImages.defaultAvatar,
      this.imageHeight,
      this.imageWidth,
      this.progressSize,
      this.showOpacity = false,
      this.clipBehavior = Clip.none});

  final String imageUrl;
  final String fallbackAssetImagePath;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit networkImageBoxFit;
  final BoxFit assetImageBoxFit;
  final Size? progressSize;
  final bool showOpacity;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: clipBehavior,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: imageWidth,
        height: imageHeight,
        color: showOpacity ? Colors.white.withOpacity(0.5) : null,
        colorBlendMode: showOpacity ? BlendMode.modulate : null,
        memCacheHeight: (100 * MediaQuery.devicePixelRatioOf(context)).toInt(),
        fit: networkImageBoxFit,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: SizedBox(
            height: progressSize?.height,
            width: progressSize?.width,
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: progressSize != null ? 2 : 4,
            ),
          ),
        ),
        cacheKey: imageUrl,
        key: ValueKey(imageUrl),
        errorWidget: (context, url, error) => Image.asset(
            fallbackAssetImagePath,
            width: imageWidth,
            height: imageHeight,
            fit: assetImageBoxFit),
      ),
    );
  }
}
