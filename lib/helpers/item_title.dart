import 'package:sot/common_libs.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    Key? key,
    this.radius,
    this.margin = const EdgeInsets.only(
      left: kDefaultMargin / 2,
      right: kDefaultMargin / 2,
    ),
    this.child,
    this.padding = const EdgeInsets.only(
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 4,
        bottom: kDefaultPadding / 4),
    this.title,
    this.onPressed,
    this.shimmerEnabled = false,
    this.showSeeMore = true,
    this.endIcons = const [],
  }) : super(key: key);
  final EdgeInsets margin;
  final bool shimmerEnabled;
  final EdgeInsets padding;
  final String? title;
  final Widget? child;
  final bool showSeeMore;
  final double? radius;
  final VoidCallback? onPressed;
  final List<Widget> endIcons;
  @override
  Widget build(BuildContext context) {
    if (title == null && child == null) {
      throw ('Title or child needed.');
    } else if (title != null && child != null) {
      throw ("You can not have both title and child.");
    }
    return AppShimmer(
      shimmerEnabled: shimmerEnabled,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: shimmerEnabled ? null : onPressed,
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius ?? cornersMedium,
          ),
          gradient: LinearGradient(
              colors: shimmerEnabled
                  ? [Colors.black, Colors.black]
                  : [
                      klightPink,
                      klightPink.withOpacity(.8),
                      klightPink.withOpacity(.7),
                    ])),
      margin: margin,
      padding: padding,
      child: child ??
          Row(
            children: [
              Expanded(
                child: Text(
                  title ?? '',
                  style: context.bodyLarge(
                    color: kDarkColor,
                  ),
                ),
              ),
              ...endIcons,
              if (showSeeMore)
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: kDarkColor,
                ),
            ],
          ),
    ).fadeIn();
  }
}
