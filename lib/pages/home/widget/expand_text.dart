import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? scale;
  final TextAlign? textAlign;
  final bool? softWrap;

  const AppText(this.text,
      {super.key, this.style, this.textAlign, this.softWrap, this.scale});

  @override
  Widget build(BuildContext context) {
    return ExpandOnHover(
      scale: scale,
      child: Text(
        text,
        softWrap: softWrap,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
