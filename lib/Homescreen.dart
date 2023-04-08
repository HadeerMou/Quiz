import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quiz/Controller/quiz_contoller.dart';
import 'package:quiz/View/quizscreen.dart';
import 'package:quiz/Model/questionModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameContoller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit(context){
    FocusScope.of(context).unfocus();
    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
  }

  @override
  void dispose(){
    _nameContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(
          children: [
            SafeArea(child: 
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2,),
                  Text("Let's start Quiz", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Enter your Name below"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )
                    ),
                  ),
                  Spacer(),
            Form(
              key: _formKey,
              child: GetBuilder<QuizController>(
                builder: (controller) => TextFormField(
                  controller: _nameContoller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius:BorderRadius.all(Radius.circular(15.0)))),
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Name should not be empty';
                        }else{
                          return null;
                        }
                      },
                      onSaved: (String? val) {
                        controller.name = val!.trim().toUpperCase();
                      },
                        onFieldSubmitted: (_) => _submit(context),
                ),
              ),
            ),
                  InkWell(
                    onTap: () => _submit(context),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20.0* 0.75),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text("Let's Start Quiz",style: Theme.of(context).textTheme.labelLarge),
                    ),
                  ),
                  Spacer(flex: 2,),
                ],
              ),),),
    
          ]),
      ),
    );
  }
}