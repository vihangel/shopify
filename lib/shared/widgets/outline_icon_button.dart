import 'package:flutter/material.dart';
import 'package:shopify/shared/utils/colors.dart';

class OutlineIconButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final Widget? icon;

  final String text;
  final Color? secondaryColor;
  final Color? primaryColor;
  final double? width;
  final double? height;

  const OutlineIconButtonWidget({
    Key? key,
    this.onPressed,
    this.icon,
    this.width,
    this.height,
    required this.text,
    this.secondaryColor,
    this.primaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) onPressed!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: secondaryColor ?? ShopfyColors.green,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            color: primaryColor ?? ShopfyColors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: primaryColor ?? Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
