import 'package:flutter/material.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
                  'Log In',
                  style: TextStyle(fontFamily: 'Stormlight'),
                  ),
                ),
        backgroundColor: Colors.teal[100],
      ),

      body: Container(
        color:Colors.black,
        child: SizedBox(height: 20, width: 20,)),
    );
  }
}