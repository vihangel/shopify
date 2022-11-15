import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify/shared/widgets/buttons.dart';
import 'package:shopify/shared/widgets/base_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

final TextEditingController userController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class LoginScreenState extends BaseState<LoginScreen>
    with WidgetsBindingObserver {
  bool obscureText = false;

  final baseTranslate = "login";

  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _form(),
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SvgPicture.asset('assets/img/logo.svg'),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 60),
          //   child: TextFieldWidget(
          //     controller: userController,
          //     autovalidateMode: true,
          //     hintText: translate('$baseTranslate.hintUser'),
          //     text: translate('$baseTranslate.user'),
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return translate('$baseTranslate.emptyUser');
          //       }
          //       return null;
          //     },
          //     keyboardType: TextInputType.emailAddress,
          //     focusNode: userFocus,
          //     onEditingComplete: () {
          //       FocusScope.of(context).requestFocus(passwordFocus);
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 24),
          //   child: TextFieldWidget(
          //     autovalidateMode: true,
          //     focusNode: passwordFocus,
          //     keyboardType: TextInputType.emailAddress,
          //     controller: passwordController,
          //     hintText: translate('$baseTranslate.hintPassword'),
          //     text: translate('$baseTranslate.password'),
          //     onEditingComplete: () {
          //       _pressLogin();
          //     },
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return translate('$baseTranslate.emptyPassword');
          //       }
          //       return null;
          //     },
          //     obscureText: obscureText,
          //     suffixIconOnPressed: () {
          //       setState(() {
          //         obscureText = !obscureText;
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: _btnConfirmar(),
          ),
          TextButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ForgotPasswordScreen()));
              },
              child: Text(translate('$baseTranslate.forgot'))),
        ],
      ),
    );
  }

  Widget _btnConfirmar() {
    return Button(
      onPress: () {
        _pressLogin();
      },
      text: translate('common.advance'),
    );
  }

  void _pressLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState!.validate()) {
      passwordController.clear();
    }
  }
}
