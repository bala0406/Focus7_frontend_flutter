import 'package:flutter/cupertino.dart';
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
}

class QuestionBuilder extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuestionBuilder(this.questions);

  @override
  _QuestionBuilderState createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder> {
  List<QuestionModel> questions;

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _pageController,
      itemCount: questions.length ?? 0,
      itemBuilder: (context, index) {
        return Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                        style: Styles.questionNumberTextStyle
                            .copyWith(fontSize: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //back button
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(20.0)),
                            gradient: Styles.primaryGradient),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() {
                                print("pressed");
                                _pageController.animateToPage(index - 1,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeOut);
                              });
                            },
                            child: index != 0
                                ? Container(
                                    width: 80,
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Styles.primaryColor,
                                      size: 24,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                      //next button and finish button at last page
                      index != 6
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  gradient: Styles.primaryGradient),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      setState(() {
                                        print("pressed");
                                        _pageController.animateToPage(index + 1,
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeOut);
                                      });
                                    },
                                    child: Container(
                                      width: 80,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Styles.primaryColor,
                                      ),
                                    )),
                              ),
                            )
                          : Container( //finish button
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  gradient: Styles.primaryGradient),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                              
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 50),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Finish",
                                        style: Styles.titleWhiteTextStyle
                                            .copyWith(
                                                color: Styles.primaryColor),
                                      ),
                                    )),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
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
