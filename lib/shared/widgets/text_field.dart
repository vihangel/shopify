import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify/shared/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? text;
  final String? hintText;
  final Color? color;
  final bool? autovalidateMode;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool? obscureText;
  final VoidCallback? suffixIconOnPressed;
  final bool isRequiredField;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const TextFieldWidget(
      {super.key,
      this.text,
      this.color,
      required this.controller,
      this.onSubmitted,
      this.hintText,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines,
      this.onEditingComplete,
      this.onChanged,
      this.validator,
      this.focusNode,
      this.obscureText,
      this.suffixIconOnPressed,
      bool? isRequiredField = false,
      this.autovalidateMode,
      this.suffixIcon,
      this.onTap})
      : isRequiredField = isRequiredField ?? false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "$text",
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: isRequiredField ? '*' : "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ShopfyColors.green,
                        ),
                      )
                    ],
                  ),
                ))
            : Container(),
        TextFormField(
          onTap: onTap,
          autovalidateMode: autovalidateMode == true
              ? AutovalidateMode.onUserInteraction
              : null,
          focusNode: focusNode,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          maxLines: maxLines ?? 1,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onSubmitted,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.name,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 15),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: ShopfyColors.gray,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: _borderInput(),
            focusedBorder: _borderInput(),
            errorBorder: _borderInput(),
            focusedErrorBorder: _borderInput(),
            errorStyle: const TextStyle(
              color: ShopfyColors.red,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: obscureText == null
                ? suffixIcon
                : obscureText!
                    ? IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: ShopfyColors.gray,
                        ),
                        onPressed: suffixIconOnPressed,
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.visibility_off,
                          color: ShopfyColors.gray,
                        ),
                        onPressed: suffixIconOnPressed,
                      ),
          ),
        ),
      ],
    );
  }

  InputBorder _borderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: color ?? ShopfyColors.gray, width: 2));
  }
}
