import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'interview_store.dart';

class InterviewPage extends StatefulWidget {
  final String title;
  const InterviewPage({Key? key, this.title = 'InterviewPage'})
      : super(key: key);
  @override
  InterviewPageState createState() => InterviewPageState();
}

class InterviewPageState extends State<InterviewPage> {
  final InterviewStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                _header(),
                _penaltList(),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                _penaltyButton(),
                _finishButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nome do candidato",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
            ),
          ),
          SizedBox(
            height: 71,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "1h 30min",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 37,
        right: 22,
        top: 53,
        bottom: 18,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
              0xff193283,
            ),
            Color(
              0xff142869,
            ),
          ],
        ),
      ),
    );
  }

  Widget _penaltList() {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Cruzou os braços'),
          subtitle: Text('Falta leve'),
          trailing: Container(
            child: Center(child: Text('1')),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Color(0xff219653),
                borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }

  Widget _finishButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Finalizar",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _penaltyButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Modular.to.pushNamed('/penalty');
          },
          child: Text('Adicionar penalidade'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Color(0xfff5f5f5)),
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Color(0xff000E55))),
          ),
        ),
      ),
    );
  }
}
