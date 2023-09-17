import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static final TextStyle appBarTextStyle = GoogleFonts.raleway(
    color: const Color(0xFF232323),
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle headerLargeStyle = GoogleFonts.raleway(
    fontSize: 90.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle headerStyle = GoogleFonts.raleway(
    fontSize: 42.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle creditCardNumberStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 30.sp,
    fontWeight: FontWeight.normal,
  );

  static final titleStyle3 = GoogleFonts.raleway(
    fontSize: 44.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleStyle2 = GoogleFonts.raleway(
    fontSize: 38.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titleStyle1 = GoogleFonts.raleway(
    fontSize: 34.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titleStyle0 = GoogleFonts.raleway(
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle subTitleStyle2 = GoogleFonts.roboto(
    fontSize: 28.sp,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle subTitleStyle1 = GoogleFonts.roboto(
    fontSize: 26.sp,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle subTitleStyle0 = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle buttonStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );
}
