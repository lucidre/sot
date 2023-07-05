import 'package:sot/common_libs.dart';

///App Scaaffold
class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool enableInternetCheck;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final List<Widget> bannerActions;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.bannerActions = const [],
    this.enableInternetCheck = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: GetX<ConnectionStatusController>(
        builder: (controller) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: body,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: appBar == null ? (context.topPadding + 10) : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!controller.hasConnection && enableInternetCheck) ...[
                      buildNetworkWidget(context),
                      verticalSpaceMedium,
                    ],
                    if (bannerActions.isNotEmpty)
                      for (final banner in bannerActions) ...[
                        banner,
                        verticalSpaceMedium,
                      ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  Widget buildNetworkWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding / 4),
      margin: const EdgeInsets.only(
        left: kDefaultMargin / 4,
        right: kDefaultMargin / 4,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(.5),
        borderRadius: BorderRadius.circular(cornersSmall),
      ),
      child: Row(
        children: [
          Text(
            'No network connnetion',
            style: context.bodyMedium(
              color: kLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.warning_rounded,
            color: kLightColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
