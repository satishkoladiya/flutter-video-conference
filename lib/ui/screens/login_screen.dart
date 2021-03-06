import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/ui/widgets/circle_checkbox.dart';
import 'package:video_conference/ui/widgets/inputField.dart';
import 'package:video_conference/viewmodels/loginscreen_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      viewModelBuilder: () => LoginScreenViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/illustrations/login.jpeg",
                    fit: BoxFit.cover,
                    width: 250,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: model.emailController,
                    validator: model.mailValid(),
                    hint: "Email id",
                    keyboardType: TextInputType.emailAddress,
                    error: model.emailError,
                    iconData: FlutterIcons.email_minus_outline_mco,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: model.passController,
                    validator: model.passValid(),
                    hint: "Password",
                    keyboardType: TextInputType.text,
                    iconData: FlutterIcons.textbox_password_mco,
                    obscure: true,
                    error: model.passwordError,
                  ),
                  SizedBox(height: 15),
                  CircleCheckbox(
                      value: model.check,
                      onChanged: (bool c) {
                        model.checkTap();
                      }),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => model.login(),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
