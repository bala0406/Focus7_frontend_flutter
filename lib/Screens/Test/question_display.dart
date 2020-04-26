import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Models/question_model.dart';
import 'package:focus7/Screens/Test/timer.dart';

class Question extends StatefulWidget {
  final List<QuestionModel> questions;

  const Question({this.questions});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Styles.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  "Are you sure want to quit the test?",
                  style: Styles.titleWhiteTextStyle,
                ),
                actions: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(new Radius.circular(20.0)),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            child:
                                Text("No", style: Styles.titleWhiteTextStyle)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(new Radius.circular(20.0)),
                      color: Styles.errorRed,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            child:
                                Text("Yes", style: Styles.titleWhiteTextStyle)),
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Timer(),
            SizedBox(height: 40),
            Expanded(child: QuestionBuilder(widget.questions)),
          ],
        ),
      ),
    );
  }

  Widget option({String option, Function onTap}) {
    bool isSelected = false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: isSelected == false ? Styles.primaryColor : Colors.amber,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            splashColor: Styles.highlightColor,
            onTap: onTap,
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(option, style: Styles.answerTextStyle)),
          ),
        ),
      ),
    );
  }
}

class QuestionBuilder extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuestionBuilder(this.questions);

  @override
  _QuestionBuilderState createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder> {
  List<QuestionModel> questions;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    print(questions[0].question);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: questions.length ?? 0,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Question  ${index + 1} / ",
                      style: Styles.questionNumberTextStyle,
                    ),
                    Text(
                      "7",
                      style:
                          Styles.questionNumberTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  questions[index].question,
                  style: Styles.questionTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20),
              option(option: questions[index].option_1, onTap: () {}),
              option(option: questions[index].option_2, onTap: () {}),
              option(option: questions[index].option_3, onTap: () {}),
              option(option: questions[index].option_4, onTap: () {}),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget option({String option, Function onTap}) {
    bool isSelected = false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: isSelected == false ? Styles.primaryColor : Colors.amber,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            splashColor: Styles.highlightColor,
            onTap: onTap,
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(option, style: Styles.answerTextStyle)),
          ),
        ),
      ),
    );
  }
}
