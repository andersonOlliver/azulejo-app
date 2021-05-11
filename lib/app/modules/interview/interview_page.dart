import 'package:flutter_modular/flutter_modular.dart';
import 'package:azulejo/app/modules/interview/interview_store.dart';
import 'package:flutter/material.dart';

class InterviewPage extends StatefulWidget {
  final String title;
  const InterviewPage({Key? key, this.title = 'InterviewPage'}) : super(key: key);
  @override
  InterviewPageState createState() => InterviewPageState();
}
class InterviewPageState extends State<InterviewPage> {
  final InterviewStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}