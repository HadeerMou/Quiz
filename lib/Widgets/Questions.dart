import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Model/questionModel.dart';
import 'package:quiz/Controller/quiz_contoller.dart';
import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  final Questions questionModel; 
  const QuestionCard({Key? key, required this.questionModel}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 450,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(questionModel.question, style: Theme.of(context).textTheme.headline6,),
            const Spacer(),
            ...List.generate(questionModel.options.length, (index) => Column(
              children: [
                AnswerOption(
                  text: questionModel.options[index],
                  index: index, 
                  quesId: questionModel.Id, 
                  onPressed: () => Get.find<QuizController>().checkAnswer(questionModel, index)
                ),
              const SizedBox(height: 15,),
              ],
            ))
            ],
          ),),
      ),
    );
  }
}