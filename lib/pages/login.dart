import 'package:app_movil/pages/register.dart';
import 'package:app_movil/pages/rutas.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Fondo con gradiente
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

          /// Ondas decorativas
          CustomPaint(size: Size.infinite, painter: ModernWavePainter()),

          /// Contenido login
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
                      "Bienvenido",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF051F20),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Campo correo
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

                    /// Campo contraseña
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

                    const SizedBox(height: 25),

                    /// BOTON LOGIN
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Rutas(opcion_ir: 0),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF235347),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// BOTON REGISTRO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("¿No tienes cuenta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Regístrate",
                            style: TextStyle(
                              color: Color(0xFF235347),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
