import 'package:sot/common_libs.dart';

class BackgroundImage extends StatelessWidget {
  final String image;
  final double? height;
  final Color? color;
  final double? width;
  final double? opacity;
  final double? scale;
  final double? angle;
  final BoxFit? fit;

  const BackgroundImage(
    this.image, {
    Key? key,
    this.color,
    this.opacity,
    this.scale,
    this.angle,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHero(
      tag: 'background_images',
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return Opacity(
      opacity: opacity ?? 1,
      child: Transform.scale(
        scale: scale ?? 1,
        child: Transform.rotate(
          angle: angle ?? 0,
          child: Image.asset(
            image,
            fit: fit,
            color: color,
            width: height,
            height: width,
          ),
        ),
      ),
    );
  }
}
