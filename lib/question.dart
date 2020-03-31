import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'Models/question_model.dart';
import 'Services/question_Service.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Widget questionCount() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("Question ", style: Theme.of(context).textTheme.body1),
          Text("1 ", style: Theme.of(context).textTheme.body1),
          Text("/ ", style: Theme.of(context).textTheme.body1),
          Text("7", style: Theme.of(context).textTheme.body2),
        ],
      ),
    );
  }

  Widget questionview({String question}) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        question,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }

  Widget option({String option}) {
    Color disabledColor = Theme.of(context).disabledColor;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: disabledColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            splashColor: Theme.of(context).primaryColorDark,
            onTap: () {
              setState(() {
                disabledColor = Theme.of(context).primaryColorDark;
              });
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(18.0),
              child: Text(option, style: Theme.of(context).textTheme.display2),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: QuestionService().getQuestions(),
          builder: (context, snapshot) {
            List<QuestionModel> data = snapshot.data;
            if (data != null) {
              return Column(
                children: <Widget>[
                  questionCount(),
                  questionview(question: data[1].question),
                  option(option: data[1].option_1),
                  option(option: data[1].option_2),
                  option(option: data[1].option_3),
                  option(option: data[1].option_4)
                ],
              );
            } else {
              return Center(child: Loading(indicator: BallPulseIndicator()));
            }
          }),
    );
  }
}
