import 'package:sot/common_libs.dart';

import 'package:sot/pages/home/widget/expand_text.dart';

class HomeItem1 extends StatelessWidget {
  const HomeItem1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kLightColor.withOpacity(.7),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'assets/images/image7.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top:
            kDefaultPadding * (ResponsiveWidget.isSmallScreen(context) ? 5 : 6),
        bottom:
            kDefaultPadding * (ResponsiveWidget.isSmallScreen(context) ? 2 : 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            'THE BUSINESS OF\nFASHION MASTERCLASS',
            textAlign: TextAlign.center,
            style: context.bodyNotoSerif(
              color: kDarkColor,
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 70,
            ),
          ).fadeIn(),
          verticalSpaceSmall,
          AppText(
            'Become the Fashion Boss !!!',
            style: context.bodyMedium(
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 25,
              color: kDarkColor,
            ),
          ).fadeInAndMoveFromBottom(),
          verticalSpaceLarge,
          AppBtn.from(
            onPressed: () {},
            isSecondary: false,
            text: 'REGISTER',
            padding: const EdgeInsets.all(kDefaultPadding),
          ),
        ],
      ),
    );
  }
}
