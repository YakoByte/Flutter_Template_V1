import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../utils/globals.dart';
import '../../utils/common_components/common_text.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });

  Future<void> requestLocationPermission();
}

class DialogServiceV1 implements DialogService {
  @override
  Future<void> requestLocationPermission() async {
    final permissionStatus = await Permission.location.status;
    if (permissionStatus.isGranted) {
      print("denined");
      await Permission.location.request();

      if (permissionStatus.isDenied) {
        print("deninedopenAppSettings");
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      print("isPermanentlyDenied");
      await openAppSettings();
    } else {}
  }

  @override
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  }) {
    if (Globals.navigatorKey.currentContext == null) {
      return;
    }
    ScaffoldMessenger.of(Globals.navigatorKey.currentContext!).clearSnackBars();

    ScaffoldMessenger.of(Globals.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        content: Text(
          content,
          style: ptSansTextStyle(
            color: textclr,
          ),
        ),
      ),
    );
  }
}

final dialogServiceProvider = Provider<DialogService>(
  (ref) => DialogServiceV1(),
);
