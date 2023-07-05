import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/widget/expand_hover.dart';
import 'package:sot/pages/home/widget/expand_text.dart';

class HomeItem2 extends StatefulWidget {
  const HomeItem2({super.key});

  @override
  State<HomeItem2> createState() => _HomeItem2State();
}

class _HomeItem2State extends State<HomeItem2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            kLightColor.withOpacity(.05),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'assets/images/doddle2.jpg',
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
      crossAxisAlignment: ResponsiveWidget.isSmallScreen(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        AppText(
          'CONFERENCE DETAILS',
          style: context.bodyNotoSerifTitle(),
        ),
        verticalSpaceMedium,
        AppText(
          'Do not miss this significant details.',
          softWrap: true,
          style: context.bodyMedium(),
        ),
        verticalSpaceMedium,
        buildIcon(Icons.calendar_month_rounded, 'Date', 'November 25-26, 2023'),
        buildIcon(Icons.pin_drop_rounded, 'Meeting Location', 'Virtually'),
        buildIcon(Icons.speaker_group_rounded, 'Speakers Details',
            '10+ speakers,  20 sponsors and partners'),
        buildIcon(
            Icons.people_alt_rounded, 'Availiable Slots', '50 slots left'),
        buildIcon(Icons.account_circle_rounded, 'Target Audience',
            'Fashion Enterpreneurer'),
        buildIcon(Icons.monetization_on_rounded, 'Fee', '\$ 50.00'),
        buildIcon(Icons.timelapse_rounded, 'Duration', '3 Weeks'),
        verticalSpaceLarge,
        AppBtn.from(
          onPressed: () {},
          isSecondary: false,
          text: 'REGISTER',
        ),
      ],
    );
  }

  ExpandOnHover buildImage() {
    return ExpandOnHover(
      scale: ResponsiveWidget.isSmallScreen(context) ? 1.05 : 1.15,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornersMedium),
        ),
        child: Image.asset(
          "assets/images/masterclass.jpeg",
          height: (ResponsiveWidget.isSmallScreen(context)
              ? context.screenWidth / 1.5
              : context.screenHeight / 2),
          width: (ResponsiveWidget.isSmallScreen(context)
              ? context.screenWidth / 1.5
              : context.screenHeight / 2),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, String title, String body) {
    if (ResponsiveWidget.isSmallScreen(context)) {
      return buildIcon2(icon, title, body);
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
        right: kDefaultPadding / 4,
        left: kDefaultPadding / 4,
      ),
      child: ExpandOnHover(
        child: Row(
          children: [
            Icon(
              icon,
              color: kDarkColor,
            ),
            horizontalSpaceSmall,
            Text(
              '$title:  ',
              softWrap: true,
              style: context.bodyMedium(fontWeight: FontWeight.bold),
            ),
            Text(
              body,
              softWrap: true,
              style: context.bodyMedium(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon2(IconData icon, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        left: kDefaultPadding / 2,
      ),
      child: ExpandOnHover(
        scale: 1.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: kDarkColor,
                ),
                horizontalSpaceSmall,
                Text(
                  title,
                  softWrap: true,
                  style: context.bodyMedium(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            verticalSpaceSmall,
            Text(
              body,
              softWrap: true,
              style: context.bodyMedium(),
            ),
          ],
        ),
      ),
    );
  }
}
