import 'package:flutter/cupertino.dart';
import 'package:focus7/Models/question_model.dart';
import 'package:focus7/Services/question.dart';

class QuestionProvider extends ChangeNotifier
{
  List<QuestionModel> _questions;

   Future getQuestions() async{
   _questions = await QuestionService().getQuestions();
   notifyListeners();
   }
}