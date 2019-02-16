import 'package:flutter/material.dart';

class Widgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Material( 
          color: Colors.lightBlueAccent,
          child: Center(child: Text('Flutter App',
           textDirection: TextDirection.ltr,
           style:TextStyle(color: Colors.white,
           fontStyle:FontStyle.italic,
           fontSize: 42.0  ) , ),)
  
        );
  }

}