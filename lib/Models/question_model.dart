class QuestionModel {
  final chapterName;
  final question;
  final option_1;
  final option_2;
  final option_3;
  final option_4;
  final correctOption;
  final mark;
  final hint;

  QuestionModel.fromJson(Map<String, dynamic> json)
      : chapterName = json["chapter_name"],
        question = json["question"],
        option_1 = json["option_1"],
        option_2 = json["option_2"],
        option_3 = json["option_3"],
        option_4 = json["option_4"],
        correctOption = json["correct_option"],
        mark = json["question_mark"],
        hint = json["hint"];
}
