// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Night Light'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color lightColor = Colors.grey.shade300;
  late String colorString;
  bool isSwitchedG = false;
  bool isSwitchedR = false;
  bool isSwitchedB = false;
  bool isSwitchedY = false;

  void currentColor(String value) {
    setState(() {
      if (value == "Red") {
        lightColor = Colors.red;
      } else if (value == "Blue") {
        lightColor = Colors.blue;
      } else if (value == "Yellow") {
        lightColor = Colors.yellow;
      } else if (value == "Green") {
        lightColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                        )
                      ]),
                  child: Expanded(
                    child: Icon(
                      Icons.lightbulb,
                      size: 200,
                      color: lightColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// GREN
                        ///
                        SwitchListTile(
                          activeColor: Colors.green,
                          activeTrackColor: Colors.green,
                          title: const Text("Yeşil"),
                          subtitle: const Text("Green"),
                          secondary: const Icon(
                            Icons.lightbulb,
                            color: Colors.green,
                          ),
                          value: isSwitchedG,
                          onChanged: (value) => setState(() {
                            isSwitchedR = false;
                            isSwitchedB = false;
                            isSwitchedY = false;
                            currentColor("Green");
                            isSwitchedG = !isSwitchedG;
                            if (isSwitchedG == false) {
                              lightColor = Colors.grey.shade300;
                            }
                          }),
                        ),

                        /// RED
                        ///
                        SwitchListTile(
                            activeColor: Colors.red,
                            activeTrackColor: Colors.red,
                            title: const Text("Kırmızı"),
                            subtitle: const Text("Red"),
                            secondary: const Icon(
                              Icons.lightbulb,
                              color: Colors.red,
                            ),
                            value: isSwitchedR,
                            onChanged: (value) => setState(() {
                                  isSwitchedG = false;
                                  isSwitchedB = false;
                                  isSwitchedY = false;
                                  currentColor("Red");
                                  isSwitchedR = !isSwitchedR;
                                  if (isSwitchedR == false) {
                                    lightColor = Colors.grey.shade300;
                                  }
                                })),

                        /// BLUE
                        ///
                        SwitchListTile(
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.blue,
                          title: const Text("Mavi"),
                          subtitle: const Text("Blue"),
                          secondary: const Icon(
                            Icons.lightbulb,
                            color: Colors.blue,
                          ),
                          value: isSwitchedB,
                          onChanged: (value) => setState(() {
                            isSwitchedR = false;
                            isSwitchedG = false;
                            isSwitchedY = false;
                            currentColor("Blue");
                            isSwitchedB = !isSwitchedB;
                            if (isSwitchedB == false) {
                              lightColor = Colors.grey.shade300;
                            }
                          }),
                        ),

                        /// YELLOW
                        ///
                        SwitchListTile(
                          activeColor: Colors.yellow,
                          activeTrackColor: Colors.yellow,
                          title: const Text("Sarı"),
                          subtitle: const Text("Yellow"),
                          secondary: const Icon(
                            Icons.lightbulb,
                            color: Colors.yellow,
                          ),
                          value: isSwitchedY,
                          onChanged: (value) => setState(() {
                            isSwitchedR = false;
                            isSwitchedB = false;
                            isSwitchedG = false;
                            currentColor("Yellow");
                            isSwitchedY = !isSwitchedY;
                            if (isSwitchedY == false) {
                              lightColor = Colors.grey.shade300;
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
