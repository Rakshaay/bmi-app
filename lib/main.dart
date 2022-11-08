import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



        class MyApp extends StatelessWidget {
        const MyApp({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
        return MaterialApp(
        home: MyHomePage(),
        );
        }
        }

        class MyHomePage extends StatefulWidget {
        const MyHomePage({Key? key}) : super(key: key);

        @override
        State<MyHomePage> createState() => _MyHomePageState();
        }

        class _MyHomePageState extends State<MyHomePage> {

        double height = 100;
        double weight = 100;
        @override
        Widget build(BuildContext context) {
                return Scaffold(
                        appBar: AppBar(
                                backgroundColor: Colors.blueAccent,
                                centerTitle: true,
                                title: Text(
                                        "BMI Calculator",
                                        style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 55,
                                        ),
                                ),
                        ),
                        body: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                        Text(
                                                "Your BMI is",
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                                height: 150,
                                                width: 370,
                                                color: Colors.lightGreenAccent,
                                                child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                                Text(
                                                                        "Height in m: ${height.round()}",
                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                ),
                                                                Slider(
                                                                    value: height,
                                                                    min: 50,
                                                                    max: 300,
                                                                    onChanged: (value) {
                                                                            setState(() {
                                                                                    height = value;
                                                                            });
                                                                    })
                                                        ],
                                                ),
                                        ),
                                        Container(
                                            height:150 ,
                                            width:370,
                                            color: Colors.lightGreenAccent,
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                        Text(
                                                                'Weight in kg:',
                                                                style:
                                                                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(width: 20),
                                                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                ElevatedButton(
                                                                    child: Text("+", style: TextStyle(fontSize: 14)),
                                                                    style: ButtonStyle(
                                                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                                                            EdgeInsets.all(15)),
                                                                        foregroundColor: MaterialStateProperty.all<Color>(
                                                                            Colors.white),
                                                                        backgroundColor:
                                                                        MaterialStateProperty.all<Color>(Colors.black),
                                                                        shape: MaterialStateProperty.all<
                                                                            RoundedRectangleBorder>(
                                                                            RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(18.0),
                                                                                side: BorderSide(color: Colors.white)))),
                                                                    onPressed: () => (weight++)),
                                                                SizedBox(width: 10),
                                                                Text(
                                                                        "${weight.round()}",
                                                                        style: TextStyle(
                                                                            fontSize: 25, fontWeight: FontWeight.bold),
                                                                ),
                                                                SizedBox(width: 10),
                                                                ElevatedButton(
                                                                        child: Text("-", style: TextStyle(fontSize: 14)),
                                                                        style: ButtonStyle(
                                                                            foregroundColor:
                                                                            MaterialStateProperty.all<Color>(Colors.white),
                                                                            backgroundColor:
                                                                            MaterialStateProperty.all<Color>(Colors.black),
                                                                            shape: MaterialStateProperty.all<
                                                                                RoundedRectangleBorder>(
                                                                                RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                    side: BorderSide(color: Colors.white)))),
                                                                        onPressed: () => (weight--),
                                                                )
                                                        ])
                                                ])),
                                        Container(
                                            height:100,
                                            width:370,
                                            color: Colors.blueAccent,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                        Text(
                                                                " Calculate BMI\nBMI=${((weight / (height * height)) * 10000)}",
                                                                style:
                                                                TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                                                        ),
                                                ]))
                                ],
                        ),
                );
        }
        }
