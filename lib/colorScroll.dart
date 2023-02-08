import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Color> myColor = [Colors.red, Colors.blue, Colors.yellow, Colors.green, Colors.amberAccent, Colors.blueAccent];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          separatorBuilder: (context, index){
            return Container(height: 50,
            );
          },
          itemCount: myColor.length,
          itemBuilder: (context,index){
            return Container(
              height: 400,
              width: 300,
              color: myColor[index],
            );
          },
          //scrollDirection: Axis.horizontal,
        ),
        appBar: AppBar(
          title: Text("Christian - Flutter"),
        ),
      ),
    );
  }
}
