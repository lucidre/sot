import 'dart:io';

import 'package:gap/gap.dart';
import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';

/// Shared methods across button types
Widget _buildIcon(BuildContext context, IconData icon,
        {required bool isOutlined,
        required bool isSecondary,
        required double? size}) =>
    Icon(icon,
        color: (isOutlined ? !isSecondary : isSecondary)
            ? kDarkColor
            : kLightColor,
        size: size ?? 18);

/// The core button that drives all other buttons.
class AppBtn extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AppBtn({
    Key? key,
    required this.onPressed,
    required this.semanticLabel,
    this.enableFeedback = true,
    this.isOutlined = false,
    this.isElevated = false,
    this.isLoadingEnabled = false,
    this.pressEffect = true,
    this.child,
    this.padding,
    this.expand = false,
    required this.isSecondary,
    this.circular = false,
    this.minimumSize,
    this.bgColor,
    this.border,
  })  : _builder = null,
        super(key: key);

  /// useful for elevated buttons or outlined buttons
  AppBtn.from({
    Key? key,
    required this.onPressed,
    this.enableFeedback = true,
    this.pressEffect = true,
    this.padding = const EdgeInsets.all(kDefaultPadding),
    this.expand = false,
    this.isOutlined = false,
    required this.isSecondary,
    this.minimumSize,
    this.bgColor,
    this.border,
    this.isElevated = true,
    this.isLoadingEnabled = false,
    String? semanticLabel,
    required String? text,
    IconData? icon,
    double? iconSize,
  })  : child = null,
        circular = false,
        super(key: key) {
    if (semanticLabel == null && text == null) {
      throw ('AppBtn.from must include either text or semanticLabel');
    }
    this.semanticLabel = semanticLabel ?? text ?? '';
    _builder = (context) {
      Color defaultColor = Colors.transparent;
      final textColor =
          (isOutlined ? !isSecondary : isSecondary) ? kDarkColor : kLightColor;
      if (text == null && icon == null) return const SizedBox.shrink();
      Text? txt = text == null
          ? null
          : Text(text,
              style: context.bodyLarge(
                color: textColor,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false));
      Widget? icn = icon == null
          ? null
          : _buildIcon(
              context,
              icon,
              isSecondary: isSecondary,
              size: iconSize,
              isOutlined: isOutlined,
            );
      if (isLoadingEnabled) {
        return SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator.adaptive(
            backgroundColor: defaultColor,
            valueColor: AlwaysStoppedAnimation(textColor),
          ),
        );
      } else if (txt != null && icn != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [txt, const Gap(kDefaultMargin / 2), icn],
        );
      } else {
        return (txt ?? icn)!;
      }
    };
  }

  /// useful for textbuttons or custom buttons where you specify the child
  // ignore: prefer_const_constructors_in_immutables
  AppBtn.basic({
    Key? key,
    required this.onPressed,
    this.isElevated = false,
    this.semanticLabel = '',
    this.enableFeedback = true,
    this.isOutlined = false,
    this.pressEffect = true,
    this.padding = EdgeInsets.zero,
    required this.isSecondary,
    this.circular = false,
    this.minimumSize,
    required this.child,
  })  : expand = false,
        bgColor = Colors.transparent,
        border = null,
        isLoadingEnabled = false,
        _builder = null,
        super(key: key);

  // interaction:
  final VoidCallback onPressed;
  late final String semanticLabel;
  final bool enableFeedback;

  // content:
  late final Widget? child;
  late final WidgetBuilder? _builder;

  // layout:
  final EdgeInsets? padding;
  final bool expand;
  final bool circular;
  final Size? minimumSize;
  final bool isElevated;

  // style:
  final bool isSecondary;

  final bool isOutlined;
  final bool isLoadingEnabled;
  final BorderSide? border;
  final Color? bgColor;
  final bool pressEffect;

  @override
  Widget build(BuildContext context) {
    Color defaultColor = isSecondary ? kLightColor : kGoldDark;
    Color textColor =
        (isOutlined ? !isSecondary : isSecondary) ? kDarkColor : kLightColor;
    BorderSide side = border ??
        (isOutlined
            ? BorderSide(width: 1.0, color: defaultColor)
            : BorderSide.none);

    Widget content =
        _builder?.call(context) ?? child ?? const SizedBox.shrink();
    if (expand) content = Center(child: content);

    OutlinedBorder shape = circular
        ? CircleBorder(side: side)
        : RoundedRectangleBorder(
            side: side,
            borderRadius: BorderRadius.circular(
              cornersMedium,
            ),
          );

    ButtonStyle style = ButtonStyle(
      elevation: ButtonStyleButton.allOrNull<double>(isOutlined
          ? 0.0
          : isElevated
              ? 4.0
              : 0.0),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize ?? Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: NoSplash.splashFactory,
      backgroundColor: ButtonStyleButton.allOrNull<Color>(
          isOutlined ? Colors.transparent : bgColor ?? defaultColor),
      overlayColor: ButtonStyleButton.allOrNull<Color>(
          Colors.transparent), // disable default press effect
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
          padding ?? const EdgeInsets.all(kDefaultPadding / 4)),
      enableFeedback: enableFeedback,
    );

    Widget button = TextButton(
      onPressed: () => onPressed(),
      style: style,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: textColor),
        child: content,
      ),
    );

    // add press effect:
    if (pressEffect) button = _ButtonPressEffect(button);

    // add semantics?
    if (semanticLabel.isEmpty) return button;
    return ExpandOnHover(
      child: Semantics(
        label: semanticLabel,
        button: true,
        container: true,
        child: ExcludeSemantics(child: button.fadeIn()),
      ),
    );
  }
}

/// //////////////////////////////////////////////////
/// _ButtonDecorator
/// Add a transparency-based press effect to buttons.
/// //////////////////////////////////////////////////
class _ButtonPressEffect extends StatefulWidget {
  const _ButtonPressEffect(this.child, {Key? key}) : super(key: key);
  final Widget child;

  @override
  State<_ButtonPressEffect> createState() => _ButtonPressEffectState();
}

class _ButtonPressEffectState extends State<_ButtonPressEffect> {
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: (_) => setState(() => _isDown = true),
      onTapUp: (_) => setState(
          () => _isDown = false), // not called, TextButton swallows this.
      onTapCancel: () => setState(() => _isDown = false),
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: _isDown ? 0.7 : 1,
        child: ExcludeSemantics(child: widget.child),
      ),
    );
  }
}
