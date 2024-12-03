import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/common/routes/names.dart';
import 'package:frontend/common/values/colors.dart';
import 'package:frontend/main.dart';

class BigButton extends StatefulWidget {
  final Function() onPressed;
  final double? height;
  final double? width;
  final String header;
  final double? heightPadding;
  final String iconPath;

  const BigButton(this.header, this.iconPath, this.onPressed,
      {super.key, this.width, this.height, this.heightPadding});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: widget.heightPadding ?? 0.h
      ),
      child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
              height: widget.height ?? 200.h,
              width: widget.width ?? 170.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.iconPath),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: 0.1.w,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      widget.header, textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 5.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black
                      ),
                    ),
                  )
              )
          )
      ),
    );
  }
}
