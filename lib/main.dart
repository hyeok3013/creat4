import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.lightGreen[200],
          appBar: AppBar(
            title: Text('Mosquito Killer'),
            centerTitle: true,
            backgroundColor: Colors.lightGreen,
          ),
          body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int level = 1;
  int touchNumber = 0;
  int deathPoint = 0;
  int mosquitoNumber = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lv $level',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '놓친 횟수: $touchNumber',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  // Play a sound as a one-shot, releasing its resources when it finishes playing.
                  Audio.load('assets/clap.wav')
                    ..play()
                    ..dispose();
                  touchNumber++;

                  setState(() {
                    if (mosquitoNumber == 1) {
                      deathPoint = Random().nextInt(10);
                      if (deathPoint == 4) {
                        Alert(
                                style: AlertStyle(isOverlayTapDismiss: false),
                                context: context,
                                title: "모기 퇴치 완료",
                                desc: "모기를 더 잡으러 갑시다.")
                            .show();

                        touchNumber = 0;
                        if (level < 3) {
                          level++;
                        }
                        if (mosquitoNumber < 3) {
                          mosquitoNumber++;
                        }
                      }
                    }
                    if (mosquitoNumber == 2) {
                      deathPoint = Random().nextInt(50);
                      if (deathPoint == 4) {
                        Alert(
                                style: AlertStyle(isOverlayTapDismiss: false),
                                context: context,
                                title: "모기 퇴치 완료",
                                desc: "모기를 더 잡으러 갑시다.")
                            .show();

                        touchNumber = 0;
                        if (level < 3) {
                          level++;
                        }
                        if (mosquitoNumber < 3) {
                          mosquitoNumber++;
                        }
                      }
                    }
                    if (mosquitoNumber == 3) {
                      deathPoint = Random().nextInt(500);
                      if (deathPoint == 4) {
                        Alert(
                                style: AlertStyle(isOverlayTapDismiss: false),
                                context: context,
                                title: "모기 퇴치 완료",
                                desc: "이제 자러 갑시다.")
                            .show();

                        touchNumber = 0;
                        if (level < 3) {
                          level++;
                        }
                        if (mosquitoNumber < 3) {
                          mosquitoNumber++;
                        }
                      }
                    }
                  });
                },
                child: Image(
                  image: AssetImage('images/mosquito$mosquitoNumber.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
