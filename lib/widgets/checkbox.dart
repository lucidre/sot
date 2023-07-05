import 'package:sot/common_libs.dart';
import 'package:sot/helpers/app_haptics.dart';

class SimpleCheckbox extends StatelessWidget {
  const SimpleCheckbox(
      {Key? key,
      required this.active,
      required this.onToggled,
      this.isExpanded = true,
      this.label})
      : super(key: key);
  final bool active;
  final bool isExpanded;
  final Widget? label;
  final Function(bool? onToggle) onToggled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(cornersSmall),
              ),
            ),
            value: active,
            visualDensity: const VisualDensity(horizontal: 0.5, vertical: 0.5),
            fillColor: ButtonStyleButton.allOrNull<Color>(context.textColor),
            checkColor: context.backgroundColor,
            onChanged: (bool? active) {
              AppHaptics.mediumImpact();
              onToggled.call(active);
            }),
        isExpanded ? Expanded(child: buildLabel()) : buildLabel()
      ],
    );
  }

  Widget buildLabel() {
    return label == null
        ? const SizedBox()
        : GestureDetector(
            onTap: () {
              onToggled.call(!active);
            },
            child: label,
          );
  }
}
