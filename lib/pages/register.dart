import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String tipoUsuario = "cliente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Fondo gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF051F20),
                  Color(0xFF0B2B26),
                  Color(0xFF163832),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          CustomPaint(size: Size.infinite, painter: ModernWavePainter()),

          /// Formulario
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Crear Cuenta",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF051F20),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Nombre
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Nombre completo",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Correo
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Correo",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Contraseña
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// TIPO DE USUARIO
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tipo de usuario",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF051F20),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Cliente"),
                            value: "cliente",
                            groupValue: tipoUsuario,
                            activeColor: const Color(0xFF235347),
                            onChanged: (value) {
                              setState(() {
                                tipoUsuario = value!;
                              });
                            },
                          ),
                        ),

                        Expanded(
                          child: RadioListTile(
                            title: const Text("Proveedor"),
                            value: "proveedor",
                            groupValue: tipoUsuario,
                            activeColor: const Color(0xFF235347),
                            onChanged: (value) {
                              setState(() {
                                tipoUsuario = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// BOTON REGISTRARSE
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Tipo usuario: $tipoUsuario");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF235347),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// VOLVER AL LOGIN
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ya tengo cuenta"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// MISMAS ONDAS DEL LOGIN
class ModernWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()..color = const Color(0xFF235347).withOpacity(0.6);

    Path path1 = Path();

    path1.moveTo(0, size.height * 0.75);

    path1.cubicTo(
      size.width * 0.25,
      size.height * 0.65,
      size.width * 0.75,
      size.height * 0.85,
      size.width,
      size.height * 0.75,
    );

    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    canvas.drawPath(path1, paint1);

    Paint paint2 = Paint()..color = const Color(0xFFBEB69B).withOpacity(0.6);

    Path path2 = Path();

    path2.moveTo(0, size.height * 0.85);

    path2.cubicTo(
      size.width * 0.3,
      size.height * 0.75,
      size.width * 0.7,
      size.height * 0.95,
      size.width,
      size.height * 0.85,
    );

    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
