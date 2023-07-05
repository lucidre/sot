import 'package:sot/common_libs.dart';

class ExpandOnHover extends StatefulWidget {
  final Widget child;
  final double? scale;

  const ExpandOnHover({
    super.key,
    required this.child,
    this.scale,
  });

  @override
  State<ExpandOnHover> createState() => _ExpandOnHoverState();
}

class _ExpandOnHoverState extends State<ExpandOnHover>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: medDuration,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: widget.scale ?? 1.15).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.diagonal3Values(
              1.0,
              1.0,
              _scaleAnimation?.value ?? 1,
            ),
            alignment: FractionalOffset.center,
            child: Transform.scale(
              scale: _scaleAnimation?.value,
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }

  void _toggleHover(bool hover) {
    setState(() {
      _isHovered = hover;
      if (_isHovered) {
        _animationController?.forward();
      } else {
        _animationController?.reverse();
      }
    });
  }
}
