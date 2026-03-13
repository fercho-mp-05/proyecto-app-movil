// ignore_for_file: deprecated_member_use

import 'package:app_movil/pages/configuracion.dart';
import 'package:app_movil/pages/conversation.dart';
import 'package:app_movil/pages/home.dart';
import 'package:app_movil/pages/perfil.dart';
import 'package:app_movil/pages/servicios.dart';
import 'package:flutter/material.dart';

class Rutas extends StatefulWidget {
  final int opcion_ir;
  const Rutas({super.key, required this.opcion_ir});

  @override
  State<Rutas> createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  int _opcionActiva = 0;

  _obtenerOpcion() {
    switch (_opcionActiva) {
      case 0:
        return Home();
      case 1:
        return Servicios();
      case 2:
        return const Configuracion();
      case 3:
        return const Conversation();
      case 4:
        return const Perfil();
      default:
        return Home();
    }
  }

  _obtenerTitulo() {
    List<String> titulos = [
      "HOME",
      "SERVICIOS",
      "CONFIGURACION",
      "CHAT",
      "PERFIL",
    ];
    return Text(
      titulos[_opcionActiva],
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff235347).withOpacity(0.9),
        iconTheme: IconThemeData(color: Colors.white),
        title: _obtenerTitulo(),
        centerTitle: true,
        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xff235347)),
            ),
            onPressed: () => setState(() => _opcionActiva = 4),
            icon: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade900,
              Colors.purple.shade600,
              Colors.purple.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(child: _obtenerOpcion()),
      ),
    );
  }
}
