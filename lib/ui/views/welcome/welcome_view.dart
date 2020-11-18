import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/rounded_button/rounded_button_widget.dart';
import 'package:lia_frontend/ui/views/welcome/welcome_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        viewModelBuilder: () => WelcomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: size.width * 0.3,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_bottom.png",
                      width: size.width * 0.2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kSecondaryColor)),
                      SizedBox(height: size.height * 0.05),
                      SvgPicture.asset(
                        "assets/icons/chat.svg",
                        height: size.height * 0.45,
                      ),
                      SizedBox(height: size.height * 0.05),
                      RoundedButton(
                          text: "LOGIN", press: model.navigateToLogin),
                      RoundedButton(
                        text: "SIGN UP",
                        press: model.navigateToSignup,
                        color: kPrimaryLightColor,
                        textColor: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
