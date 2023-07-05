import 'package:cached_network_image/cached_network_image.dart';
import 'package:sot/common_libs.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final bool isLoadingProgressBar;
  final double? width;
  final BoxFit? fit;
  final String? heroTag;
  const AppImage({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.isLoadingProgressBar = false,
    this.fit,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return heroTag != null
        ? AppHero(
            tag: heroTag!,
            child: buildBody(),
          )
        : buildBody();
  }

  CachedNetworkImage buildBody() {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      fit: fit ?? BoxFit.cover,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      placeholder: (context, url) => AppShimmer(
        shimmerEnabled: true,
        child: isLoadingProgressBar
            ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            : Container(
                width: width ?? double.infinity,
                height: height ?? double.infinity,
                color: Colors.black,
              ),
      ),
      errorWidget: (context, url, error) => const SizedBox(),
    );
  }
}
