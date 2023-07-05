import 'package:sot/common_libs.dart';
import 'package:sot/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController? _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isScrolled = (_scrollController?.position.pixels ?? 0) > 40;
        });
      });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: kLightColor,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              return true;
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: const HomePage(),
            ),
          ),
          buildAppBar(),
        ],
      ),
    );
  }

  Card buildAppBar() {
    return Card(
      elevation: _isScrolled ? 1.0 : 0.0,
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 0, left: 1, right: 1, bottom: 1),
      child: AnimatedContainer(
        duration: medDuration,
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding /
                (ResponsiveWidget.isSmallScreen(context) ? 2 : 1),
            vertical: 0),
        color: _isScrolled ? kLightColor : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/sot.png',
              width: 100,
              height: 80,
            ),
            const Spacer(),
            horizontalSpaceMedium,
            if (!ResponsiveWidget.isSmallScreen(context)) ...[
              AppBtn.basic(
                onPressed: () {},
                isSecondary: false,
                child: Text(
                  'Speaker',
                  style: context.bodyMedium(fontWeight: FontWeight.w600),
                ),
              ),
              horizontalSpaceMedium,
              AppBtn.basic(
                onPressed: () {},
                isSecondary: false,
                child: Text(
                  'Schedule',
                  style: context.bodyMedium(fontWeight: FontWeight.w600),
                ),
              ),
              horizontalSpaceMedium,
              AppBtn.basic(
                onPressed: () {},
                isSecondary: false,
                child: Text(
                  'Registration',
                  style: context.bodyMedium(fontWeight: FontWeight.w600),
                ),
              ),
              horizontalSpaceMedium,
              AppBtn.basic(
                onPressed: () {},
                isSecondary: false,
                child: Text(
                  'Gallery',
                  style: context.bodyMedium(fontWeight: FontWeight.w600),
                ),
              ),
            ] else ...[
              PopupMenuButton<int>(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: kDarkColor,
                ),
                onSelected: (value) {
                  //
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Speaker',
                        style: context.bodyMedium(fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Schedule',
                        style: context.bodyMedium(fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Registration',
                        style: context.bodyMedium(fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Gallery',
                        style: context.bodyMedium(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ];
                },
              ),
            ],
            horizontalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
