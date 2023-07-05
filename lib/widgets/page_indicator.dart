import 'package:sot/common_libs.dart';

class AppPageIndicator extends StatefulWidget {
  const AppPageIndicator({
    Key? key,
    required this.count,
    required this.controller,
    required this.color,
    this.opacity,
  }) : super(key: key);
  final int count;
  final PageController controller;
  final Color color;
  final double? opacity;

  @override
  State<AppPageIndicator> createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  final _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChanged);
  }

  void _handlePageChanged() {
    _currentPage.value = widget.controller.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    final data = [];
    for (var i = 0; i < widget.count; i++) {
      data.add(i);
    }
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (_, value, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: data
              .map(
                (item) => buildIndicator(
                  data.indexOf(item) == (value),
                ),
              )
              .toList(),
        );
      },
    ).fadeIn();
  }

  Widget buildIndicator(
    bool isSelected,
  ) {
    return AnimatedContainer(
      duration: fastDuration,
      width: isSelected ? 40 : 5,
      height: 5,
      margin: const EdgeInsets.only(right: kDefaultMargin / 4),
      decoration: BoxDecoration(
        color: isSelected
            ? widget.color
            : widget.color.withOpacity(widget.opacity ?? .2),
        borderRadius: BorderRadius.circular(cornersMedium),
      ),
    );
  }
}
