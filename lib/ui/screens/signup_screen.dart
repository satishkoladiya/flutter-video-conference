import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/ui/widgets/inputField.dart';
import 'package:video_conference/viewmodels/signup_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.grey[100],
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/illustrations/signup.jpeg",
                    fit: BoxFit.cover,
                    width: 250,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Signup",
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
                    hint: "Email id",
                    color: Colors.white,
                    iconData: FlutterIcons.email_minus_outline_mco,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: model.passController,
                    hint: "Password",
                    iconData: FlutterIcons.textbox_password_mco,
                    obscure: true,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: model.confirmpassController,
                    hint: "Confirm Password",
                    obscure: true,
                    iconData: FlutterIcons.textbox_password_mco,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => model.signup(),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Sign Up",
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
