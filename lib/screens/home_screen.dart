import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  final List<BarChartGroupData> barData = [
    BarChartGroupData(x: 0, barRods: [
      BarChartRodData(toY: 10, color: Colors.orange, width: 20)
    ], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(toY: 5, color: Colors.orange, width: 20)
    ], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(toY: 8, color: Colors.orange, width: 20)
    ], showingTooltipIndicators: [0]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Panel del Deportista')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Deportista Nivel 5', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            ListTile(title: Text('Estadísticas'), onTap: () => Navigator.pushNamed(context, '/home')),
            ListTile(title: Text('Calendario'), onTap: () => Navigator.pushNamed(context, '/calendar')),
            ListTile(title: Text('Logros'), onTap: () => Navigator.pushNamed(context, '/achievements')),
            ListTile(title: Text('Resultados Académicos'), onTap: () => Navigator.pushNamed(context, '/academic')),
            ListTile(title: Text('Motivación'), onTap: () => Navigator.pushNamed(context, '/motivation')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estadísticas del Deportista', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Container(
              height: 200,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BarChart(
                BarChartData(
                  barGroups: barData,
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Fuerza');
                            case 1:
                              return Text('Resistencia');
                            case 2:
                              return Text('Velocidad');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),
            SizedBox(height: 20),
            Text('Fuerza +10 | Resistencia +5 | Velocidad +8', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
