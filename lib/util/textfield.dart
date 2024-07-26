import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingolearntest/util/myColor.dart';

textField(String name,TextEditingController controller, TextInputType type,bool show,bool valid,ValueChanged<bool> onChange){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: TextFormField(
      controller: controller,
      cursorColor: MyColor.main,
      cursorHeight: 18,
      obscureText: show,
      onChanged: (_){
        onChange(true);
      },
      keyboardType: type,
      decoration: InputDecoration(
        hintText: " " + name,
        hintStyle: GoogleFonts.poppins(color: MyColor.black,fontSize: 14,fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: MyColor.transparent,
            width: 1,
          ),
        ),
        fillColor: MyColor.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: MyColor.transparent,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: MyColor.transparent,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: MyColor.transparent,
            width: 1,
          ),
        ),
        isDense: true,
        contentPadding:
        const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      ),
      validator: (_){
        if(valid){
          return "Invalid text";
        }
        return null;
      },
      style: GoogleFonts.poppins(color: MyColor.black,fontSize: 14,fontWeight: FontWeight.w400),
    ),
  );
}