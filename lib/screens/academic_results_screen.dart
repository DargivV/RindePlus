import 'package:flutter/material.dart';

class AcademicResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados Académicos')),
      body: Center(
        child: Text('Matemáticas: A | Educación Física: A+ | Lenguaje: B+',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
