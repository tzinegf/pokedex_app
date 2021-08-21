import  'package:flutter/material.dart';
import  'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';

class  AppTextStyles {
static  final titleHome = GoogleFonts.lexendDeca(
fontSize: 32,
fontWeight: FontWeight.w600,
color: AppColors.grey,
);
static  final subTitleHeading = GoogleFonts.lexendDeca(
fontSize: 15,
fontWeight: FontWeight.w200,
color: AppColors.grey
);
static  final subTitleBoldHeading = GoogleFonts.lexendDeca(
fontSize: 20,
fontWeight: FontWeight.w400,
color: AppColors.grey,
);
static  final titleBoldHeading = GoogleFonts.lexendDeca(
fontSize: 20,
fontWeight: FontWeight.w600,
color: AppColors.primary,
);
static  final titleBoldBackground = GoogleFonts.lexendDeca(
fontSize: 20,
fontWeight: FontWeight.w600,
color: AppColors.shape,
);
}