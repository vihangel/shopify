import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify/shared/utils/colors.dart';
import 'package:shopify/shared/widgets/buttons.dart';
import 'package:shopify/shared/widgets/outline_button.dart';

class Alert {
  static Future<void> open(
    BuildContext context, {
    String? title,
    String? subTitle,
    String titleMainButton = 'ok',
    String? titleSecondaryButton,
    VoidCallback? functionMainButton,
    VoidCallback? functionSecondaryButton,
    bool? iconStatus,
    Widget? textField,
    bool mainButtonIsOutline = false,
    Color? colorMainButton,
  }) async {
    return showDialog(
        context: context,
        builder: ((context) => Dialog(
              insetPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (iconStatus == true)
                      const Icon(
                        Icons.check_circle,
                        color: ShopfyColors.green,
                        size: 100,
                      ),
                    if (iconStatus == false)
                      SvgPicture.asset(
                        "assets/img/alert.svg",
                        height: 100,
                      ),
                    const SizedBox(height: 20),
                    Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ShopfyColors.dark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    subTitle != null
                        ? Text(
                            subTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ShopfyColors.dark,
                            ),
                          )
                        : Container(),
                    textField ?? Container(),
                    const SizedBox(height: 20),
                    titleSecondaryButton == null
                        ? Button(
                            text: titleMainButton,
                            onPress: functionMainButton,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                mainButtonIsOutline
                                    ? OutlineButton(
                                        color: colorMainButton,
                                        text: titleMainButton,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38,
                                        onPress: functionMainButton,
                                      )
                                    : Button(
                                        text: titleMainButton,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38,
                                        onPress: functionMainButton,
                                      ),
                                Button(
                                  text: titleSecondaryButton,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  color: ShopfyColors.green,
                                  onPress: functionSecondaryButton,
                                )
                              ])
                  ],
                ),
              ),
            )));
  }
}
