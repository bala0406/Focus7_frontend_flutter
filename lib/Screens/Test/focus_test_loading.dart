import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Models/question_model.dart';
import 'package:focus7/Screens/Test/question_display.dart';
import 'package:focus7/Services/question.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';

class FocusTestLoading extends StatefulWidget {
  FocusTestLoading({Key key}) : super(key: key);

  @override
  _FocusTestLoadingState createState() => _FocusTestLoadingState();
}

class _FocusTestLoadingState extends State<FocusTestLoading> {
  QuestionService questionService = QuestionService();
  List<QuestionModel> questions;

  void getQuestions() async {
    questions = await questionService.getQuestions();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            questions == null
                ? Text(
                    "Hold tight! We are preparing your Test",
                    style: Styles.titleWhiteTextStyle,
                  )
                : Text(
                    "Your Test is ready!",
                    style: Styles.titleWhiteTextStyle,
                  ),
            SizedBox(height: 20),
            questions == null
                ? Loading(
                    indicator: LineScaleIndicator(),
                    color: Styles.highlightColor,
                    size: 60,
                  )
                : BouncingWidget(
                    onPressed: () {},
                    scaleFactor: 0.2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: Styles.primaryGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Question(
                                            questions: this.questions)));
                              },
                              child: Column(children: <Widget>[
                                Container(
                                    height: 55,
                                    child: Center(
                                        child: Text(
                                      "Start",
                                      style: Styles.titleHighlightTextStyle
                                          .copyWith(color: Styles.primaryColor),
                                    ))),
                              ]),
                            ),
                          )),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

// class FocusTestloading extends StatefulWidget {
//   @override
//   _FocusTestloadingState createState() => _FocusTestloadingState();
// }

// class _FocusTestloadingState extends State<FocusTestloading> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//               child: Center(
//           child:FutureBuilder(
//             future: QuestionService().getQuestions(),
//             builder: (context,snapshot){
//             if(snapshot.hasData){
//              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionDisplay()));
//              return null;
//             }else{
//              return Column(
//                 children: <Widget>[
//                   Text("getting your questions"),
//                   Loading()
//                 ],
//               );
//             }
//           },)
//         ),
//       ),

//     );
//   }
// }
