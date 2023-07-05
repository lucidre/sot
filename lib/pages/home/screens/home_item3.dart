import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';
import 'package:sot/pages/home/widget/expand_text.dart';

class HomeItem3 extends StatefulWidget {
  const HomeItem3({super.key});

  @override
  State<HomeItem3> createState() => _HomeItem3State();
}

class _HomeItem3State extends State<HomeItem3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kDarkColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kDarkColor.withOpacity(.3),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: buildImage(),
            ),
          ),
          horizontalSpaceLarge,
          horizontalSpaceLarge,
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: buildDetails(),
            ),
          )
        ]);
  }

  Widget smallSizeWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: buildImage(),
          ),
          verticalSpaceLarge,
          buildDetails()
        ]);
  }

  Column buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'SIMIRE OMOTOYOSI TIJESUNI (SOT)',
          scale: 1.05,
          style: context.bodyNotoSerifTitle(color: kLightColor),
        ),
        verticalSpaceMedium,
        AppText(
          "SOT is a start-up expert and an entrepreneur per excellence. He has helped over 2500 brands pass through their ideation stage.\n\nHe is the CEO, Wurafadakagc, Africa’s most innovative fashion brand. He is also the Founder of Start-up Adventure, an initiative that makes him travel around Europe to produce documentaries on prominent brands and engage them on how they started with the aim of equipping youths on how to start their various ideas.\n\nHe also runs a Fashion University in Nigeria, where he and his team educate people on how to run their fashion businesses effectively in the 21st century. He believes in a greater Africa.\n\nHis passion to see young people like him excel is second to none, as he uses himself as an example of grass to grace.\n\nHe is the Lead Mentor of YFA, a community that raises youths and young teenagers to become KINGDOM MINDED, FIRE BRAND and INFLUENTIAL Soldiers. YFA started in 2020 and has turned naive young people into sophisticated and excellent men and women. ",
          softWrap: true,
          scale: 1.01,
          textAlign: TextAlign.start,
          style: context.bodyMedium(
            color: kLightColor,
          ),
        ),
        verticalSpaceLarge,
        ExpandOnHover(
          child: Image.asset(
            'assets/logo/sot.png',
            width: 200,
            height: 100,
          ),
        ),
      ],
    );
  }

  ExpandOnHover buildImage() {
    return ExpandOnHover(
      scale: 1.05,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornersMedium),
        ),
        child: Image.asset(
          "assets/images/sot_image.JPG",
          height: ResponsiveWidget.isSmallScreen(context)
              ? context.screenWidth / 1.6
              : context.screenHeight / 1.4,
          width: ResponsiveWidget.isSmallScreen(context)
              ? context.screenWidth / 1.6
              : (context.screenHeight / 1.4) / 1.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
