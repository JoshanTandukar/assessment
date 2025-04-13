import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Sizedbox on num {
  SizedBox get sBHh => SizedBox(height: toDouble().h);
  SizedBox get sBHw => SizedBox(height: toDouble().w);

  SizedBox get sBWw => SizedBox(width: toDouble().w);
  SizedBox get sBWh => SizedBox(width: toDouble().h);
}
