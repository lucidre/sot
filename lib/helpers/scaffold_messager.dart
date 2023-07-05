import 'package:sot/common_libs.dart';
import 'package:sot/main.dart';

AppScaffoldMessenger $scaffold = AppScaffoldMessenger();

class AppScaffoldMessenger {
  showSnackBar(String text) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
          content: Text(
        text,
      )),
    );
  }

  showErrorSnackBar(BuildContext context) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text(
            'An error occurred with the data fetch, please try again later.'),
      ),
    );
  }
}
