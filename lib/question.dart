import 'package:flutter/material.dart';

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

  Widget questionview() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        "The synthesis of alkyl fluorides is best accomplished by",
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
    return Column(
      children: <Widget>[
        questionCount(),
        questionview(),
        option(option: "Free radical fluorination"),
        option(option: "Sandmeyer's reaction"),
        option(option: "Finkelstein reaction"),
        option(option: "Swarts reaction")
      ],
    );
  }
}
