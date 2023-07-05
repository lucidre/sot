import 'package:sot/common_libs.dart';
import 'package:sot/widgets/page_indicator.dart';

class HomeItem6 extends StatefulWidget {
  const HomeItem6({super.key});

  @override
  State<HomeItem6> createState() => HomeItem6State();
}

class HomeItem6State extends State<HomeItem6> {
  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kDarkColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kDarkColor.withOpacity(.5),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'assets/images/image5.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: kDefaultPadding * 2,
        bottom: kDefaultPadding * 2,
        right: ResponsiveWidget.isSmallScreen(context) ? kDefaultPadding : 0,
        left: ResponsiveWidget.isSmallScreen(context) ? kDefaultPadding : 0,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? smallSizeWidget()
          : SizedBox(
              width: context.screenWidth / 2,
              child: largeSizeWidget(),
            ),
    );
  }

  Column largeSizeWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SOT\'S TEACHING.',
            textAlign: TextAlign.center,
            style: context.bodyNotoSerifTitle(
              color: kLightColor,
            ),
          ),
          verticalSpaceLarge,
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornersMedium),
            ),
            height: 500,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 300,
                    margin: const EdgeInsets.all(kDefaultMargin / 2),
                    decoration: BoxDecoration(
                      color: kLightColor,
                      borderRadius: BorderRadius.circular(cornersMedium),
                    ),
                    width: context.screenWidth / 1.5,
                  );
                }),
          ),
          verticalSpaceLarge,
          AppPageIndicator(
            count: 5,
            controller: controller!,
            color: kLightColor,
          ),
        ]);
  }

  Column smallSizeWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SOT\'S TEACHING.',
            textAlign: TextAlign.center,
            style: context.bodyNotoSerifTitle(
              color: kLightColor,
            ),
          ),
          verticalSpaceLarge,
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornersMedium),
              ),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 300,
                      margin: const EdgeInsets.all(kDefaultMargin / 2),
                      decoration: BoxDecoration(
                        color: kLightColor,
                        borderRadius: BorderRadius.circular(cornersMedium),
                      ),
                      width: context.screenWidth / 1.5,
                    );
                  }),
            ),
          ),
          verticalSpaceLarge,
          AppPageIndicator(
            count: 5,
            controller: controller!,
            color: kLightColor,
          ),
        ]);
  }
}
