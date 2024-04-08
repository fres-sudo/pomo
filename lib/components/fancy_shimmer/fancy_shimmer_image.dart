library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pomo/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

import 'defaults.dart';
import 'widgets/widgets.dart';

///Widget that uses chached network image and Shimmer widgets to create
///beautiful widgets that are cached and have nice Shimmer effect
class FancyShimmerImage extends StatelessWidget {
  FancyShimmerImage(
      {super.key,
      required this.imageUrl,
      this.boxFit = BoxFit.fill,
      this.width = 300,
      this.height = 300,
      this.shimmerDirection = ShimmerDirection.ltr,
      this.shimmerDuration = const Duration(milliseconds: 1500),
      this.cacheKey,
      this.shimmerBaseColor,
      this.shimmerHighlightColor,
      this.shimmerBackColor,
      this.errorWidget,
      this.boxDecoration,
      this.color,
      this.alignment,
      this.imageBuilder,
      this.textErrorVisible = true});

  final String imageUrl;
  final double width;
  final double height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit boxFit;
  final String? cacheKey;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? shimmerBackColor;
  final Widget? errorWidget;
  final BoxDecoration? boxDecoration;
  final Color? color;
  final Alignment? alignment;
  final ImageWidgetBuilder? imageBuilder;
  final bool textErrorVisible;

  final ValueNotifier<int> _networklHasErrorNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _networklHasErrorNotifier,
        builder: (BuildContext context, dynamic count, Widget? child) {
          return kIsWeb
              ? Image.network(
                  imageUrl,
                  headers: const <String, String>{
                    'Access-Control-Allow-Origin': "*",
                    'Access-Control-Allow-Methods':
                        'GET, POST, OPTIONS, PUT, PATCH, DELETE',
                    'Access-Control-Allow-Headers':
                        'X-Requested-With,Content-Type, Authorization',
                    'Access-Control-Allow-Credentials': "true"
                  },
                  fit: boxFit,
                  width: width,
                  height: height,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: kPrimary500,
                        ),
                      );
                    }
                  },
                )
              : CachedNetworkImage(
                  alignment: alignment ?? Alignment.center,
                  cacheKey:
                      imageUrl + _networklHasErrorNotifier.value.toString(),
                  imageUrl: imageUrl,
                  fit: boxFit,
                  width: width,
                  height: height,
                  httpHeaders: const <String, String>{
                    'Access-Control-Allow-Origin': "*",
                    'Access-Control-Allow-Methods':
                        'GET, POST, OPTIONS, PUT, PATCH, DELETE',
                    'Access-Control-Allow-Headers':
                        'X-Requested-With,Content-Type, Authorization',
                    'Access-Control-Allow-Credentials': "true"
                  },
                  placeholder: (context, url) => ImageShimmerWidget(
                    width: width,
                    height: height,
                    shimmerDirection: shimmerDirection,
                    shimmerDuration: shimmerDuration,
                    baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
                    highlightColor:
                        shimmerHighlightColor ?? defaultShimmerHighlightColor,
                    backColor: shimmerBackColor ?? defaultShimmerBackColor,
                    boxDecoration: boxDecoration,
                  ),
                  errorWidget: (context, url, error) {
                    return GestureDetector(
                      onTap: () {
                        _networklHasErrorNotifier.value++;
                      },
                      child: Container(
                        width: width,
                        height: height,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error, color: Colors.red),
                            Visibility(
                                visible: textErrorVisible,
                                child: Text(
                                  "Clicca per riprovare",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  cacheManager: CacheManager(
                    Config(
                      "pomo_key",
                      stalePeriod: const Duration(hours: 1),
                    ),
                  ),
                );
        });
  }
}
