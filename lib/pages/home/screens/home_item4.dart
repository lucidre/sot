import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/home_page.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';
import 'package:sot/pages/home/widget/expand_text.dart';

class HomeItem4 extends StatefulWidget {
  const HomeItem4({super.key});

  @override
  State<HomeItem4> createState() => _HomeItem4State();
}

class _HomeItem4State extends State<HomeItem4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kLightColor.withOpacity(.1),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'assets/images/image6.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: kDefaultPadding * 3,
        bottom: kDefaultPadding * 3,
        right: ResponsiveWidget.isSmallScreen(context) ? kDefaultPadding : 0,
        left: ResponsiveWidget.isSmallScreen(context) ? kDefaultPadding : 0,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? smallSizeWidget()
          : SizedBox(
              width: context.screenWidth / 1.5, child: largeSizeWidget()),
    );
  }

  Row largeSizeWidget() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: buildDetails(),
          ),
          horizontalSpaceLarge,
          horizontalSpaceLarge,
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: buildImage(),
            ),
          ),
        ]);
  }

  Widget smallSizeWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(),
          verticalSpaceLarge,
          buildDetails(),
        ]);
  }

  ExpandOnHover buildImage() {
    final double width =
        ResponsiveWidget.isSmallScreen(context) ? context.screenWidth / 2 : 400;
    return ExpandOnHover(
      scale: ResponsiveWidget.isSmallScreen(context) ? 1.05 : 1.2,
      child: Container(
        height: width + 60,
        alignment: Alignment.center,
        child: AnimatedCircleAvatar(
          isOuter: true,
          radius: width + 40,
          child: AnimatedCircleAvatar(
            isOuter: false,
            radius: width + 20,
            child: Container(
              height: width,
              width: width,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "assets/images/image1.jpg",
                height: width,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align buildDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'REGISTER',
            scale: 1.05,
            style: context.bodyNotoSerifTitle(),
          ),
          verticalSpaceLarge,
          AppText(
            'Ready to conquer fashion?\n\nAre you ready to embark on this transformative journey with SOT? The Business of Fashion Masterclass awaits you, offering an unrivaled opportunity to unleash your fashion prowess and ascend to new heights of success. Join us as we delve into the captivating world of style, strategy, and entrepreneurship.\n\nIn this exclusive masterclass, we will unlock the secrets of success that have propelled industry titans to the top. Immerse yourself in the knowledge and insights shared by our esteemed panel of fashion experts, visionary designers, and business moguls. Discover how to harness your creative vision, develop a strong brand identity, and captivate your audience with irresistible fashion offerings',
            softWrap: true,
            scale: 1.05,
            textAlign: TextAlign.start,
            style: context.bodyMedium(),
          ),
          verticalSpaceLarge,
          AppBtn.from(
            onPressed: () {},
            isSecondary: false,
            text: "LET'S GO!!!",
          ),
        ],
      ),
    );
  }
}
