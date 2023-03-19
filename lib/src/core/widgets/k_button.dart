import 'package:bloc_test/src/core/extensions/build_context_extension.dart';
import 'package:bloc_test/src/core/utils/color.dart';
import 'package:bloc_test/src/core/utils/dimensions.dart';
import 'package:flutter/material.dart';


class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.borderRadius,
    this.bgColor,
    this.height,
    this.width,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final double? borderRadius;
  final Color? bgColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      color: bgColor ?? mainColor,
      height: height ?? 42,
      minWidth: width ?? context.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeDefault,
      ),
      elevation: 0,
      child: child,
    );
  }
}
