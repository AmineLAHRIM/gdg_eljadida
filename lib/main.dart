import 'package:flutter/material.dart';
import 'package:gdg_eljadida/app/core/di/injection.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  configureDependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
