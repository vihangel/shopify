import 'package:flutter/material.dart';
import 'package:shopify/shared/utils/colors.dart';

class Button extends StatelessWidget {
  final Function? onPress;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? width;
  final bool canClick;

  const Button(
      {super.key,
      this.onPress,
      required this.text,
      this.color,
      this.width,
      bool? canClick,
      this.textColor})
      : canClick = canClick ?? true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null && canClick) onPress!();
      },
      child: Container(
        width: width ?? double.maxFinite,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: canClick ? color ?? ShopfyColors.dark : ShopfyColors.gray,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: canClick ? textColor ?? Colors.white : ShopfyColors.dark,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
