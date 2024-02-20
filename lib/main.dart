import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:convert';
import 'package:scube_flutter_task/model/model.dart';
import 'package:scube_flutter_task/view/projects.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        home: ProjectView(),
      ),
    );
  }
}
