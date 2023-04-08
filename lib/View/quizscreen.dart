import 'package:flutter/material.dart';
import 'package:quiz/Controller/quiz_contoller.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/Widgets/Questions.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quiz_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Icon(Icons.toggle_off_outlined)
      ],
        title: Text('Quiz App'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 119, 0)
            ),
          ),
          SafeArea(
            child: GetBuilder<QuizController>(
              init: QuizController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Question',
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: controller.numberOfQuestions.round().toString(),
                            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                          ),
                          TextSpan(
                            text: '/',
                            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                          ),
                          TextSpan(
                            text: controller.countOfQuestion.round().toString(),
                            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                          ),
                        ])
                    ),
                  ],),
              ),
              const SizedBox( height: 18),
              SizedBox(
                height: 450,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) => QuestionCard(
                    questionModel: controller.questionList[index],
                  ),
                  controller: controller.pageController,
                  itemCount: controller.questionList.length,
                  ),
              ),
            ],
          ),))
        ], 
      ),
    floatingActionButton: GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) =>  IconButton(
          onPressed: () => controller.nextQuestion(),
           icon: Icon(Icons.toggle_off_outlined)
           ),
    ),
    );
  }
}