import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage() {
    Future.delayed(
      Duration(seconds: 4),
      () => Modular.to.pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF193283),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/logo-azulejo.svg',
              semanticsLabel: 'Logotipo azulejo',
              height: MediaQuery.of(context).size.height / 3,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 3) * 1,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              'Azulejo',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
