import 'package:edu_app/screens/home/home_screen.dart';
import 'package:edu_app/widgets/app_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              SizedBox(height: 40,),
              const Text("This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it. "),
              SizedBox(height: 40,),
              AppCircleButton(
                  onTap: ()=>{
                    Get.toNamed("/home")
            },
                  child:  Icon(Icons.arrow_forward, size: 35,))
            ],
          ),
        ),
      ),
    );
  }
}
