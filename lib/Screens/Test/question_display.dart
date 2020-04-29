import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Models/question_model.dart';
import 'package:focus7/Screens/Test/test_summary_page.dart';
import 'package:focus7/Screens/Test/timer.dart';
import 'package:focus7/Widgets/settings.dart';
import 'package:gradient_text/gradient_text.dart';

GlobalKey key = GlobalKey();

class Question extends StatefulWidget {
  final List<QuestionModel> questions;

  const Question({this.questions});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> with TickerProviderStateMixin {
  List<QuestionModel> questions;
//question builder
  List<String> get correctOptions {
    List<String> optionsList = [];
    for (int i = 0; i < questions.length; i++) {
      optionsList.add(questions[i].correctOption);
    }
    return optionsList;
  }

  List<String> selectedOptions = [null, null, null, null, null, null, null];
  PageController _pageController = PageController();
  //Timer
  AnimationController _controller;
  Animation animation;

  String get timerString {
    Duration duration = _controller.duration * _controller.value;
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();
    //question builder
    questions = widget.questions;
    //Timer
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 7));
    animation = Tween<double>(begin: 0.1, end: 1).animate(_controller);
    _controller.forward(from: _controller.value);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        calculateMarksandNavigateToSummary();
      }
    });
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
                ],
              );
            });
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Transform.translate(
                      offset: Offset(0, -15), //Size(0,-30).center(Offset.zero)
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              return CustomPaint(
                                  painter: TimerBar(animation: animation));
                            }),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Text(
                              timerString,
                              style: Styles.timerTextStyle,
                              textAlign: TextAlign.center,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
                child: PageView.builder(
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
                        Column(
                          //options column
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: new Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  color: questions[index].isOptionOneSelected ==
                                          false
                                      ? Styles.primaryColor
                                      : Styles.highlightColor,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    splashColor:
                                        questions[index].isOptionOneSelected ==
                                                false
                                            ? Styles.highlightColor
                                            : Styles.primaryColor,
                                    onTap: () {
                                      if (selectedOptions[index] == null) {
                                        selectedOptions[index] =
                                            questions[index].option_1;
                                      } else {
                                        selectedOptions[index] = null;
                                      }
                                      setState(() {
                                        questions[index].isOptionOneSelected =
                                            !questions[index]
                                                .isOptionOneSelected;
                                        questions[index].isOptionTwoSelected =
                                            false;
                                        questions[index].isOptionThreeSelected =
                                            false;
                                        questions[index].isOptionFourSelected =
                                            false;
                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(20),
                                        child: Text(questions[index].option_1,
                                            style: Styles.answerTextStyle)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: new Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  color: questions[index].isOptionTwoSelected ==
                                          false
                                      ? Styles.primaryColor
                                      : Styles.highlightColor,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    splashColor:
                                        questions[index].isOptionTwoSelected ==
                                                false
                                            ? Styles.highlightColor
                                            : Styles.primaryColor,
                                    onTap: () {
                                      if (selectedOptions[index] == null) {
                                        selectedOptions[index] =
                                            questions[index].option_2;
                                      } else {
                                        selectedOptions[index] = null;
                                      }
                                      setState(() {
                                        questions[index].isOptionOneSelected =
                                            false;
                                        questions[index].isOptionTwoSelected =
                                            !questions[index]
                                                .isOptionTwoSelected;
                                        questions[index].isOptionThreeSelected =
                                            false;
                                        questions[index].isOptionFourSelected =
                                            false;
                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(20),
                                        child: Text(questions[index].option_2,
                                            style: Styles.answerTextStyle)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: new Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  color:
                                      questions[index].isOptionThreeSelected ==
                                              false
                                          ? Styles.primaryColor
                                          : Styles.highlightColor,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    splashColor: questions[index]
                                                .isOptionThreeSelected ==
                                            false
                                        ? Styles.highlightColor
                                        : Styles.primaryColor,
                                    onTap: () {
                                      if (selectedOptions[index] == null) {
                                        selectedOptions[index] =
                                            questions[index].option_3;
                                      } else {
                                        selectedOptions[index] = null;
                                      }
                                      setState(() {
                                        questions[index].isOptionOneSelected =
                                            false;
                                        questions[index].isOptionTwoSelected =
                                            false;
                                        questions[index].isOptionThreeSelected =
                                            !questions[index]
                                                .isOptionThreeSelected;
                                        questions[index].isOptionFourSelected =
                                            false;
                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(20),
                                        child: Text(questions[index].option_3,
                                            style: Styles.answerTextStyle)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: new Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  color:
                                      questions[index].isOptionFourSelected ==
                                              false
                                          ? Styles.primaryColor
                                          : Styles.highlightColor,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    splashColor:
                                        questions[index].isOptionFourSelected ==
                                                false
                                            ? Styles.highlightColor
                                            : Styles.primaryColor,
                                    onTap: () {
                                      if (selectedOptions[index] == null) {
                                        selectedOptions[index] =
                                            questions[index].option_4;
                                      } else {
                                        selectedOptions[index] = null;
                                      }
                                      setState(() {
                                        questions[index].isOptionOneSelected =
                                            false;
                                        questions[index].isOptionTwoSelected =
                                            false;
                                        questions[index].isOptionThreeSelected =
                                            false;
                                        questions[index].isOptionFourSelected =
                                            !questions[index]
                                                .isOptionFourSelected;
                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(20),
                                        child: Text(questions[index].option_4,
                                            style: Styles.answerTextStyle)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //back button
                              Container(
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
                                        _pageController.animateToPage(index - 1,
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeOut);
                                      });
                                    },
                                    child: index != 0
                                        ? Container(
                                            width: 80,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
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
                              index != questions.length - 1
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              new Radius.circular(20.0)),
                                          gradient: Styles.primaryGradient),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            onTap: () {
                                              setState(() {
                                                print("pressed");
                                                _pageController.animateToPage(
                                                    index + 1,
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    curve: Curves.easeOut);
                                              });
                                            },
                                            child: Container(
                                              width: 80,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Styles.primaryColor,
                                              ),
                                            )),
                                      ),
                                    )
                                  : Container(
                                      //finish button
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              new Radius.circular(20.0)),
                                          gradient: Styles.primaryGradient),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            onTap: () {
                                              calculateMarksandNavigateToSummary();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 50),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Finish",
                                                style: Styles
                                                    .titleWhiteTextStyle
                                                    .copyWith(
                                                        color: Styles
                                                            .primaryColor),
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
            )),
          ],
        ),
      ),
    );
  }

  void calculateMarksandNavigateToSummary() {
    int marks = 0;
    for (int i = 0; i < correctOptions.length; i++) {
      if (selectedOptions[i] == correctOptions[i]) {
        marks += 1;
      }
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TestSummary(marks)));
  }
}

GlobalKey<_QuestionBuilderState> _globalKey = GlobalKey();

class QuestionBuilder extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuestionBuilder({Key key, this.questions}) : super(key: key);

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

  List<String> get correctOptions {
    List<String> optionsList = [];
    for (int i = 0; i < questions.length; i++) {
      optionsList.add(questions[i].correctOption);
    }
    return optionsList;
  }

  List<String> selectedOptions = [null, null, null, null, null, null, null];

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
                Column(
                  //options column
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                          color: questions[index].isOptionOneSelected == false
                              ? Styles.primaryColor
                              : Styles.highlightColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            splashColor:
                                questions[index].isOptionOneSelected == false
                                    ? Styles.highlightColor
                                    : Styles.primaryColor,
                            onTap: () {
                              if (selectedOptions[index] == null) {
                                selectedOptions[index] =
                                    questions[index].option_1;
                              } else {
                                selectedOptions[index] = null;
                              }
                              setState(() {
                                questions[index].isOptionOneSelected =
                                    !questions[index].isOptionOneSelected;
                                questions[index].isOptionTwoSelected = false;
                                questions[index].isOptionThreeSelected = false;
                                questions[index].isOptionFourSelected = false;
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(20),
                                child: Text(questions[index].option_1,
                                    style: Styles.answerTextStyle)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                          color: questions[index].isOptionTwoSelected == false
                              ? Styles.primaryColor
                              : Styles.highlightColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            splashColor:
                                questions[index].isOptionTwoSelected == false
                                    ? Styles.highlightColor
                                    : Styles.primaryColor,
                            onTap: () {
                              if (selectedOptions[index] == null) {
                                selectedOptions[index] =
                                    questions[index].option_2;
                              } else {
                                selectedOptions[index] = null;
                              }
                              setState(() {
                                questions[index].isOptionOneSelected = false;
                                questions[index].isOptionTwoSelected =
                                    !questions[index].isOptionTwoSelected;
                                questions[index].isOptionThreeSelected = false;
                                questions[index].isOptionFourSelected = false;
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(20),
                                child: Text(questions[index].option_2,
                                    style: Styles.answerTextStyle)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                          color: questions[index].isOptionThreeSelected == false
                              ? Styles.primaryColor
                              : Styles.highlightColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            splashColor:
                                questions[index].isOptionThreeSelected == false
                                    ? Styles.highlightColor
                                    : Styles.primaryColor,
                            onTap: () {
                              if (selectedOptions[index] == null) {
                                selectedOptions[index] =
                                    questions[index].option_3;
                              } else {
                                selectedOptions[index] = null;
                              }
                              setState(() {
                                questions[index].isOptionOneSelected = false;
                                questions[index].isOptionTwoSelected = false;
                                questions[index].isOptionThreeSelected =
                                    !questions[index].isOptionThreeSelected;
                                questions[index].isOptionFourSelected = false;
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(20),
                                child: Text(questions[index].option_3,
                                    style: Styles.answerTextStyle)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                          color: questions[index].isOptionFourSelected == false
                              ? Styles.primaryColor
                              : Styles.highlightColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            splashColor:
                                questions[index].isOptionFourSelected == false
                                    ? Styles.highlightColor
                                    : Styles.primaryColor,
                            onTap: () {
                              if (selectedOptions[index] == null) {
                                selectedOptions[index] =
                                    questions[index].option_4;
                              } else {
                                selectedOptions[index] = null;
                              }
                              setState(() {
                                questions[index].isOptionOneSelected = false;
                                questions[index].isOptionTwoSelected = false;
                                questions[index].isOptionThreeSelected = false;
                                questions[index].isOptionFourSelected =
                                    !questions[index].isOptionFourSelected;
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(20),
                                child: Text(questions[index].option_4,
                                    style: Styles.answerTextStyle)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                      index != questions.length - 1
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
                          : Container(
                              //finish button
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(20.0)),
                                  gradient: Styles.primaryGradient),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      calculateMarksandNavigateToSummary();
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

//TODO use this option function to remove repeating options widget for each option
  Widget option({String option, Function onTap}) {
    bool isOptionSelected = false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: isOptionSelected == false
              ? Styles.primaryColor
              : Styles.highlightColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            splashColor: isOptionSelected == false
                ? Styles.highlightColor
                : Styles.primaryColor,
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

  void calculateMarksandNavigateToSummary() {
    int marks = 0;
    for (int i = 0; i < correctOptions.length; i++) {
      if (selectedOptions[i] == correctOptions[i]) {
        marks += 1;
      }
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TestSummary(marks)));
  }
}

//TODO move class to a separate file
class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  String get timerString {
    Duration duration = _controller.duration * _controller.value;
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0.1, end: 1).animate(_controller);
    _controller.forward(from: _controller.value);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Transform.translate(
              offset: Offset(0, -15), //Size(0,-30).center(Offset.zero)
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return CustomPaint(
                          painter: TimerBar(animation: animation));
                    }),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Text(
                      timerString,
                      style: Styles.timerTextStyle,
                      textAlign: TextAlign.center,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

// paints the animated Timer Bar to the screen
class TimerBar extends CustomPainter {
  final Gradient gradient = Styles.primaryGradient;
  final Color timerBarColor = Styles.primaryColor;
  final Animation animation;

  TimerBar({this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = timerBarColor
      ..style = PaintingStyle.fill;

    //background painter
    Rect rect = new Rect.fromLTWH(0, 0, size.width, 30);

    RRect rrectContainer =
        new RRect.fromRectAndRadius(rect, Radius.circular(50));
    canvas.drawRRect(rrectContainer, paint);

    // foreground animated painter
    paint.shader = gradient.createShader(rect);

    Rect rectAnim = new Rect.fromLTWH(0, 0, size.width * animation.value, 30);
    RRect rrect = new RRect.fromRectAndRadius(rectAnim, Radius.circular(50));

    canvas.drawRRect(rrect, paint);
  }

  //animation callback
  @override
  bool shouldRepaint(TimerBar oldDelegate) {
    return animation != oldDelegate.animation;
  }
}

//TODO move class to a seperate file
class TestSummary extends StatelessWidget {
  final int marks;

  TestSummary(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "You Scored",
                  style: Styles.headlineWhiteTextStyle,
                ),
              ),
              SizedBox(height: 20),
              GradientText(
                "$marks",
                style: Styles.headlineWhiteTextStyle.copyWith(fontSize: 50),
                gradient: Styles.primaryGradient,
              ),
              SizedBox(height: 20),
              Text(
                markComments().toString(),
                style: Styles.titleWhiteTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(new Radius.circular(20.0)),
              gradient: Styles.primaryGradient,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: Text("Exit",
                        style: Styles.titleWhiteTextStyle
                            .copyWith(color: Styles.primaryColor))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String markComments() {
    String comment;
    if (marks == 0 || marks == 1 || marks == 2) {
      comment = "Keep yourself Motivated. Try Again. You can!";
    } else if (marks == 3 || marks == 4) {
      comment =
          "Good,You're halfway through. That's a great Achievement. Try hard";
    } else if (marks == 5 || marks == 6) {
      comment = "Excellent work,You're so close. You can do It. Try again";
    } else if (marks == 7) {
      comment = "Awesome.You're breathTaking.Keep Grinding";
    }
    return comment;
  }
}
