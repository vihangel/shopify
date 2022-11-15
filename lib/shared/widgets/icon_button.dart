import 'package:flutter/material.dart';
import 'package:shopify/shared/utils/colors.dart';

class IconButtonWidget extends StatelessWidget {
  final Function? onPress;
  final Widget? icon;

  final String text;
  final Color? primaryColor;
  final Color? secondaryColor;
  final double? width;
  final double? height;

  const IconButtonWidget({
    Key? key,
    this.onPress,
    this.icon,
    this.width,
    this.height,
    required this.text,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) onPress!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: primaryColor ?? ShopfyColors.green,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            const SizedBox(height: 15),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor ?? Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
