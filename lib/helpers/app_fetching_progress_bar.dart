import 'package:sot/common_libs.dart';

class AppFetchingProgressBar extends StatefulWidget {
  final Stream<bool> stream;

  const AppFetchingProgressBar({Key? key, required this.stream})
      : super(key: key);

  @override
  State<AppFetchingProgressBar> createState() => _AppFetchingProgressBarState();
}

class _AppFetchingProgressBarState extends State<AppFetchingProgressBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.stream,
      initialData: false,
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.hasData) {
          return (snapshot.data ?? false)
              ? Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.all(kDefaultMargin / 4),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(
                      context.$isDarkMode ? kLightColor : kDarkColor,
                    )),
                  ),
                )
              : const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
