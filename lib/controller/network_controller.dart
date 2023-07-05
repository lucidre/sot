import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionStatusController extends GetxController {
  static final ConnectionStatusController instance = Get.find();
  //This tracks the current connection status
  final RxBool _hasConnection = true.obs;
  bool get hasConnection => _hasConnection.value;

  final Connectivity _connectivity = Connectivity();
  ConnectionStatusController() {
    _checkConnection();
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    final newStatus = result != ConnectivityResult.none;

    if (newStatus != hasConnection) {
      _hasConnection.value = newStatus;
    }
  }

  void _checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    final newStatus = result != ConnectivityResult.none;

    if (newStatus != hasConnection) {
      _hasConnection.value = newStatus;
    }
  }
}
