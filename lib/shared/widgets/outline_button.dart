import 'package:flutter/material.dart';
import 'package:shopify/shared/utils/colors.dart';

class OutlineButton extends StatelessWidget {
  final Function? onPress;
  final String text;
  final Color? color;
  final double? width;
  const OutlineButton({
    Key? key,
    this.onPress,
    required this.text,
    this.color,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) onPress!();
      },
      child: Container(
        width: width ?? double.maxFinite,
        padding: const EdgeInsets.all(12),
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            color: color ?? ShopfyColors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color ?? ShopfyColors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
