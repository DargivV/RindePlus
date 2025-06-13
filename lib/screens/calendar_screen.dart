import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendario de Entrenamiento')),
      body: Center(
        child: Icon(Icons.calendar_today, size: 100, color: Colors.orange),
      ),
    );
  }
}
