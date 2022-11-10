import 'package:flutter/material.dart';
import 'package:firstapp/SecondPage.dart';
void main() {
        runApp(const MyApp());
}

class MyApp extends StatelessWidget {
        const MyApp({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
                return MaterialApp(
                        initialRoute: '/',
                        routes: {
                                '/home':(context)=> MyHomePage(),
                                '/second':(context)=>SecondPage(),
                        },
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
        double bmi = 0;
        String it = "";
        void _inc() {
                setState(() {
                        weight++;
                });
        } //inc

        void _dec() {
                setState(() {
                        weight--;
                });
        } //dec

        void _bnmi() {
                setState(() {
                        bmi=(weight/(height*height))*10000;
                        if (bmi<18)
                        {it="Underweight";}
                        else if(bmi>18 && bmi<25)
                        {it="Normal weight";}
                        else if(bmi>25 && bmi<30)
                        {it="Overweight";}
                        else
                        {it="Obese";}

                });
        }
        @override
        Widget build(BuildContext context) {
                return Scaffold(
                  backgroundColor: Colors.black,
                        appBar: AppBar(
                                backgroundColor: Colors.lightBlue,
                                title: Text ("BMI Calculator",
                                        style: TextStyle(color: Colors.white),
                                ),
                        ),
                        body:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                        Text(
                                                "Enter your height here:",
                                                style: TextStyle(fontSize:20, color: Colors.white),
                                                textAlign: TextAlign.start,
                                        ),

                                        Container(
                                            decoration: BoxDecoration(

                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Colors.greenAccent,
                                            ),

                                            height: 150,
                                            width: 250,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                        Text(
                                                                "Height: ${height.round()}",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Color(0xff000000)
                                                                ),
                                                        ),
                                                        Slider(value: height, min:5, activeColor: Colors.white, inactiveColor: Colors.white, max: 200, onChanged:(value) {
                                                                setState(() {
                                                                        height = value;
                                                                });
                                                        }
                                                        )
                                                ]
                                            )
                                        ),

                                        Text(
                                                "Enter your weight here:",
                                                style: TextStyle(fontSize:20, color: Colors.white),
                                        ),

                                        Container(
                                            height: 150,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Colors.greenAccent,
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                        Text(
                                                                "Weight: ${weight}",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Color(0xff000000)
                                                                ),
                                                        ),
                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                                    MaterialButton(
                                                                            onPressed: () {_inc();},
                                                                            elevation: 1.0,
                                                                            color: Colors.white,
                                                                            hoverColor: Colors.green,
                                                                            highlightColor: Colors.greenAccent,
                                                                            child: Icon(
                                                                                    Icons.add,
                                                                                    size: 50.0,
                                                                            ),

                                                                            padding: EdgeInsets.all(10.0),
                                                                            shape: CircleBorder(),
                                                                    ),
                                                                    MaterialButton(
                                                                            onPressed: () {_dec();},
                                                                            elevation: 1.0,
                                                                            color: Colors.white,
                                                                            hoverColor: Colors.red,
                                                                            highlightColor: Colors.redAccent,
                                                                            child: Icon(
                                                                                    Icons.remove,
                                                                                    size: 50.0,
                                                                            ),

                                                                            padding: EdgeInsets.all(10.0),
                                                                            shape: CircleBorder(),
                                                                    )
                                                            ]
                                                        )
                                                ]
                                            )
                                        ),
                                        ElevatedButton(
                                                onPressed: () {
                                                        _bnmi();
                                                        Navigator.pushNamed(context, '/second', arguments: Argument(bmi, it));
                                                },//onPressed
                                                child: Text('Calculate',
                                                        style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xff000000),
                                                        ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.grey,
                                                        shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(5), // <-- Radius
                                                        ),
                                                ),
                                        ),
                                        //       Text("BMI=${bmi.round()}\nYou are in the category: ${it}",
                                        //           style: TextStyle(fontSize:40, color: Color(0xff230000)
                                        // ),
                                        // ),
                                ]
                            ),
                            ]
                        ),
                );
        }
}
