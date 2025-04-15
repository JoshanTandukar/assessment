import 'package:assessment/enum/font.dart';
import 'package:assessment/global/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class STextTheme {
  STextTheme._();

  static TextTheme textTheme = ThemeData().textTheme.copyWith(
        headlineLarge: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 36px / Font size: 24px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        headlineMedium: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 33px / Font size: 22px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        headlineSmall: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 30px / Font size: 20px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        titleLarge: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 27px / Font size: 18px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        titleMedium: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500, // Medium weight
          height: 1.5, // Line height: 24px / Font size: 16px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        titleSmall: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 21px / Font size: 14px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        bodyLarge: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 18px / Font size: 12px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        bodyMedium: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
          decoration: TextDecoration.none,
          color: AppColor.neutral900,
        ),
        bodySmall: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500, // Medium weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
        labelLarge: TextStyle().copyWith(
          fontFamily: Font.Monroe.name,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600, // SemiBold weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
          color: AppColor.neutral900,
        ),
      );
}
