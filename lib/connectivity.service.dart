import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ConnectiveService extends GetxService {
  static ConnectiveService get to => Get.find();

  // define
  Connectivity connection = Connectivity();

  Future<ConnectiveService> init() async {
    return this;
  }

  //  check status
  Future<bool> isLive() async =>
      checkState(await connection.checkConnectivity());

  // check status with notification user about the internet connection
  Future<bool> isLiveWithNotification() async {
    bool status = await isLive();
    if (!status) {
      noConnectionAreAvailable();
    }
    return status;
  }

  //stream check
  Stream<ConnectivityResult> stream() => connection.onConnectivityChanged;

  // check the status
  bool checkState(ConnectivityResult connectivityResult) {
    // if none return false
    if (connectivityResult == ConnectivityResult.none) return false;

    // return true
    return true;
  }

  void noConnectionAreAvailable() {
    Get.snackbar(
      'No connections are available'.tr,
      'Checking the network Wi-fi or mobile signal.'.tr,
      icon: const Icon(Icons.wifi_off_rounded),
      colorText: Colors.white,
      backgroundColor: Colors.red[300],
    );
  }
}
