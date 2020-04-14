import 'dart:convert';

import 'package:focus7/Models/question_model.dart';

import 'package:http/http.dart' as http;

class QuestionService {
  List<QuestionModel> question;

  String _url = "https://focus7-stage.herokuapp.com/api/getquestions";

  Future<List<QuestionModel>> getQuestions() async {
    http.Response response = await http.get(_url);

    List collection = jsonDecode(response.body);
    question = collection.map((json) => QuestionModel.fromJson(json)).toList();

    return question;
  }
}
