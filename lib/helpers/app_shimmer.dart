import 'package:shimmer/shimmer.dart';
import 'package:sot/common_libs.dart';

class AppShimmer extends StatelessWidget {
  final bool shimmerEnabled;
  final Color? shimmerColor;
  final Widget child;

  const AppShimmer(
      {Key? key,
      required this.shimmerEnabled,
      required this.child,
      this.shimmerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmerEnabled
        ? Shimmer.fromColors(
            baseColor: shimmerColor?.withOpacity(.9) ??
                context.textColor.withOpacity(0.1),
            highlightColor: shimmerColor ?? context.textColor.withOpacity(0.2),
            child: child,
          )
        : child;
  }
}
