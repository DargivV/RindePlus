import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // come los JSON

// importacion de las pantallas p
import 'package:flutter_applications_1/screens/entrenador_screen.dart';
import 'package:flutter_applications_1/screens/mensajes_motivacionales_screen.dart';
import 'package:flutter_applications_1/screens/plan_entrenamiento_screen.dart';
import 'package:flutter_applications_1/screens/psicologo_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/achievements_screen.dart';
import 'screens/academic_results_screen.dart';
import 'screens/motivation_screen.dart';

// Versión de mi app ---------- Pendiente :ver si el yaml tambien lo define o no )
const String currentAppVersion = "1.0.0";

// buscar el json en el repositorio
const String versionUrl =
    "https://github.com/DargivV/RindePlus.git/master/version.json";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Colors.white;
  final Color secondaryColor = Colors.grey[100]!;
  final Color accentColor = Colors.orange;

  /// COnectara GitHub y verifica la  versión
  Future<void> checkForUpdate(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(versionUrl),
      ); // busca el archivo JSON con el parametro versionUrl (el que ya tiene el link del repositorio )
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // conversion de json
        String remoteVersion = data["version"]; // Obtiene la versión remota
        String message = data["message"]; // Obtiene el mensaje para el usuario

        // comprobar si son misma version
        if (remoteVersion != currentAppVersion) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("¡Actualización disponible!"),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      print("Error al verificar la actualización: $e");
    }
  }

  @override //carga  la parte grafica de la app
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RINDE +',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: secondaryColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: accentColor,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', color: Colors.black),
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Builder(
          builder: (context) {
            checkForUpdate(context); // Verificar  actualización al iniciar
            return LoginScreen(); // Tu pantalla de inicio
          },
        ),
        '/home': (context) => HomeScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/achievements': (context) => AchievementsScreen(),
        '/academic': (context) => AcademicResultsScreen(),
        '/motivation': (context) => MotivationScreen(),
        '/psicologo': (context) => PsicologoScreen(),
        '/entrenador': (context) => EntrenadorScreen(),
        '/mensajes': (context) => MensajesMotivacionalesScreen(),
        '/plan_entrenamiento': (context) => PlanEntrenamientoScreen(),
      },
    );
  }
}
