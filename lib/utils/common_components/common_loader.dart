import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CommonLoader extends ConsumerWidget {
  double? height;
  double? width;
  Color? color;
  Color? loadercolor;

  CommonLoader(
      {Key? key, this.height, this.width, this.color, this.loadercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? h,
      width: width ?? w,
      color: color ?? AppColors.white,
      child: Center(
          child: CircularProgressIndicator(
        color: loadercolor ?? AppColors.colorPrimary,
        strokeWidth: 2,
      )),
    );
  }
}
