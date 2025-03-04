import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final result =
            results.isNotEmpty ? results.first : ConnectivityResult.none;
        _updateConnectionStatus(result);
      },
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    try {
      _connectionStatus.value = result;
      if (_connectionStatus.value == ConnectivityResult.none) {
        Loader.warningSnackBar(title: 'No Internet Connection');
      }
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Could not update connection status');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (e) {
      Loader.errorSnackbar(
          title: 'Connection Error',
          message: e.message ?? 'Could not check connectivity status');
      return false;
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'An unexpected error occurred');
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
