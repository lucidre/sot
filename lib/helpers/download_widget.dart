import 'package:sot/common_libs.dart';

class DownloadWidget extends StatelessWidget {
  final bool isSuccessful;
  final bool isDownloading;
  final VoidCallback action;
  final String text;
  const DownloadWidget({
    required this.action,
    required this.isDownloading,
    required this.isSuccessful,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2 + context.bottom,
            top: kDefaultPadding / 2),
        child: Stack(
          children: [
            buildBackground(context),
            buildBody(context),
          ],
        ));
  }

  Widget buildBackground(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: BackgroundImage(
        multipleClothes,
        opacity: 0.03,
        height: context.screenWidth,
      ),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              color: context.textColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(
                cornersSmall,
              ),
            ),
          ),
        ),
        verticalSpaceMedium,
        (isDownloading)
            ? Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      context.$isDarkMode ? kLightColor : kDarkColor,
                    ),
                  ),
                ),
              )
            : Icon(
                isSuccessful
                    ? Icons.download_done_rounded
                    : Icons.close_rounded,
                color: isSuccessful ? Colors.green : Colors.red,
                size: 70,
              ),
        verticalSpaceMedium,
        Text(
          (isDownloading)
              ? 'Image Downloading'
              : isSuccessful
                  ? 'Downlad Success'
                  : 'Download Failed',
          style: context.bodyLarge(),
        ),
        verticalSpaceSmall,
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.bodyMedium(),
        ),
        if (!isDownloading) ...[
          verticalSpaceMedium,
          AppBtn.from(
            expand: true,
            isElevated: false,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              action.call();
            },
            isSecondary: context.$isDarkMode,
            text: isSuccessful ? 'Open Image' : 'Close',
            icon:
                isSuccessful ? Icons.file_present_rounded : Icons.close_rounded,
          ),
        ],
        verticalSpaceLarge,
      ],
    );
  }
}
