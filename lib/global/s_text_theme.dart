import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme {
  STextTheme._();

  static TextTheme textTheme = ThemeData().textTheme.copyWith(
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 36px / Font size: 24px
          letterSpacing: 0,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 33px / Font size: 22px
          letterSpacing: 0,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 30px / Font size: 20px
          letterSpacing: 0,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          height: 1.5, // Line height: 27px / Font size: 18px
          letterSpacing: 0,
        ),
        titleMedium: GoogleFonts.plusJakartaSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500, // Medium weight
          height: 1.5, // Line height: 24px / Font size: 16px
          letterSpacing: 0,
        ),
        titleSmall: GoogleFonts.plusJakartaSans(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 21px / Font size: 14px
          letterSpacing: 0,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 18px / Font size: 12px
          letterSpacing: 0,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400, // Regular weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
          decoration: TextDecoration.none,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500, // Medium weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600, // SemiBold weight
          height: 1.5, // Line height: 15px / Font size: 10px
          letterSpacing: 0,
        ),
      );
}
