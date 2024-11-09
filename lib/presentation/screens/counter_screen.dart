import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({ super.key });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  String clickWord = "Clicks";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter screen'),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_rounded)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
              Text(clickWord, style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if(clickCounter == 1) {
                clickWord = "Click";
              } else {
                clickWord = "Clicks";
              }
              
              clickCounter++;
            });
          },
          child: const Icon(Icons.plus_one),
        ),
      );
  }
}
