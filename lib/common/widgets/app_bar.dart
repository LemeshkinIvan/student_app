import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/fonts.dart';
import '../values/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final Color? leadingColor;
  final bool line;
  final ScrollController? controller;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leading,
    required this.backgroundColor,
    required this.actions,
    required this.onPressed,
    required this.leadingColor,
    required this.line,
    this.controller
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar>{
    @override
    Widget build (BuildContext context){
      return AppBar (
        elevation: 0,
        bottom: widget.line ? PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 2.0,
            color: AppColors.dividerColor.withOpacity(0.5),
          ),
        ) : null,

        actions: widget.actions,
        leading: widget.leading ?? IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: widget.onPressed ?? (){},
        ),
        title: widget.title != null ? SizedBox(
          width: 100.w, child: TextButton(
            style: ElevatedButton.styleFrom(
              disabledMouseCursor: SystemMouseCursors.none,
            ),
            onPressed: (){
              setState((){
                widget.controller?.animateTo(
                  widget.controller!.position.minScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                );});
            },
            child: Text(
              widget.title ?? "",
              style: const TextStyle (
                  fontFamily: AppFonts.primary,
                  color: AppColors.primary
              ),
            )
          ),
        ) : null,
        centerTitle: true,
      );
    }
  }