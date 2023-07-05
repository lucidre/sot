import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';

class HomeItem5 extends StatefulWidget {
  const HomeItem5({super.key});

  @override
  State<HomeItem5> createState() => _HomeItem5State();
}

class _HomeItem5State extends State<HomeItem5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kLightColor.withOpacity(.3),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'assets/images/image4.jpg',
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
              width: context.screenWidth / 1.3,
              child: buildLargeScreen(),
            ),
    );
  }

  Column smallSizeWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SOT\'S IMAGE WALL.',
            style: context.bodyNotoSerifTitle(),
          ),
          verticalSpaceLarge,
          MasonryGridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            mainAxisSpacing: kDefaultPadding / 5,
            crossAxisSpacing: kDefaultPadding / 5,
            itemCount: 16,
            itemBuilder: (context, index) {
              return ExpandOnHover(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kDarkColor,
                    border: Border.all(
                      color: kLightColor,
                    ),
                    borderRadius: BorderRadius.circular(cornersMedium),
                  ),
                  height: ((index % 5 + 1) * 50) + 100,
                ),
              );
            },
          )
        ]);
  }

  Column buildLargeScreen() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SOT\'S IMAGE WALL.',
            style: context.bodyNotoSerifTitle(),
          ),
          verticalSpaceLarge,
          SizedBox(
            height: 600,
            child: MasonryGridView.count(
              crossAxisCount: 3,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: kDefaultPadding / 5,
              crossAxisSpacing: kDefaultPadding / 5,
              itemBuilder: (context, index) {
                return ExpandOnHover(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: kDarkColor,
                      border: Border.all(
                        color: kLightColor,
                      ),
                      borderRadius: BorderRadius.circular(cornersMedium),
                    ),
                    width: ((index % 5 + 1) * 50) + 200,
                  ),
                );
              },
            ),
          )
        ]);
  }
}
