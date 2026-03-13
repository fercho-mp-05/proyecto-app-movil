import 'package:app_movil/pages/rutas.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String nombre = "Stheben Montañez";
  String correo = "stheben@email.com";
  String tipoUsuario = "Proveedor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8F7),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// FOTO Y NOMBRE
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF235347),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 10),

              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(correo, style: const TextStyle(color: Colors.grey)),

              const SizedBox(height: 10),

              /// TIPO USUARIO
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF235347),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tipoUsuario,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          /// OPCIONES
          profileOption(icon: Icons.edit, title: "Editar perfil", onTap: () {}),

          profileOption(
            icon: Icons.work,
            title: "Mis servicios",
            onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Rutas(opcion_ir: 1),
                        ),
                      );
            },
          ),

          profileOption(
            icon: Icons.settings,
            title: "Configuración",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Rutas(opcion_ir: 2)),
              );
            },
          ),

          const SizedBox(height: 20),

          /// CERRAR SESION
          profileOption(
            icon: Icons.logout,
            title: "Cerrar sesión",
            color: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget profileOption({
    required IconData icon,
    required String title,
    Color color = Colors.black87,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
