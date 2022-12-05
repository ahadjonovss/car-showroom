import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle font([int fs=12,Color clr=Colors.white,String ff="Alef"]){
  return GoogleFonts.getFont(ff).copyWith(color: clr,fontSize:fs.toDouble() );
}