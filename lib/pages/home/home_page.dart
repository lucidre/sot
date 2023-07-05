import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/screens/home_item1.dart';
import 'package:sot/pages/home/screens/home_item2.dart';
import 'package:sot/pages/home/screens/home_item3.dart';
import 'package:sot/pages/home/screens/home_item4.dart';
import 'package:sot/pages/home/screens/home_item5.dart';
import 'package:sot/pages/home/screens/home_item6.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        HomeItem1(),
        HomeItem2(),
        HomeItem3(),
        HomeItem4(),
        HomeItem5(),
        HomeItem6(),
      ],
    );
  }
}

class AnimatedCircleAvatar extends StatefulWidget {
  final bool isOuter;
  final double radius;
  final Widget child;
  const AnimatedCircleAvatar(
      {super.key,
      required this.isOuter,
      required this.radius,
      required this.child});

  @override
  State<AnimatedCircleAvatar> createState() => _AnimatedCircleAvatarState();
}

class _AnimatedCircleAvatarState extends State<AnimatedCircleAvatar> {
  Timer? _timer;
  Color? color;
  double? _radius;

  @override
  void initState() {
    super.initState();
    color = widget.isOuter ? kDarkColor : kLightColor;
    _radius = widget.radius;

    _timer = Timer.periodic(slowDuration, (Timer timer) {
      setState(() {
        if (color == kLightColor) {
          color = klightPink;
        } else if (color == kDarkColor) {
          color = kLightColor;
        } else {
          color = kDarkColor;
        }
        _radius = _radius == widget.radius ? widget.radius + 20 : widget.radius;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: slowDuration,
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        width: _radius,
        height: _radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color?.withOpacity(widget.isOuter ? 1 : 0.7) ??
              Colors.transparent,
        ),
        child: widget.child,
      ),
    );
  }
}
