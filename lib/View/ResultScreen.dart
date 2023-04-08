
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Controller/quiz_contoller.dart';
import 'package:quiz/Model/questionModel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}):super (key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GetBuilder<QuizController>(
              init: Get.find<QuizController>(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Congratulation', 
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                  ),
                  Text(controller.name, 
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                  ),
                  Text('Your Score is ', 
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                  ),
                  Text('${controller.scoreResult.round()} /100', 
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.startAgain(),
                    child:Text('Start Again'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}