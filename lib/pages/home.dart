// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final Color primaryGreen = const Color(0xff235347);

  final List categorias = [
    {"icon": Icons.electrical_services, "name": "Electricista"},
    {"icon": Icons.cleaning_services, "name": "Limpieza"},
    {"icon": Icons.plumbing, "name": "Plomería"},
    {"icon": Icons.computer, "name": "Tecnología"},
    {"icon": Icons.home_repair_service, "name": "Reparación"},
  ];

  final List servicios = [
    {"name": "Juan Pérez", "job": "Electricista", "rating": "4.9"},
    {"name": "Ana López", "job": "Limpieza", "rating": "4.8"},
    {"name": "Carlos Díaz", "job": "Soporte PC", "rating": "4.7"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8F7),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola 👋", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text(
                      "Encuentra un servicio",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.notifications_none),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            /// CATEGORIAS
            const Text(
              "Categorías",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];

                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: const Color(0xffE8F3EF),
                          child: Icon(categoria["icon"], color: primaryGreen),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categoria["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            /// BUSCADOR
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar servicios...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// SERVICIOS
            const Text(
              "Servicios cerca de ti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: servicios.length,
              itemBuilder: (context, index) {
                final servicio = servicios[index];

                return serviceCard(
                  servicio["name"],
                  servicio["job"],
                  servicio["rating"],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff235347),
        onPressed: () {
          _BuscandoServicios(context);
        },
        child: Icon(Icons.radar, color: Colors.white),
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: selectedIndex == index ? primaryGreen : Colors.black54,
      ),
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  Widget serviceCard(String name, String job, String rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xff235347),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(job, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(rating),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _BuscandoServicios(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text("Buscando servicios")),
    );
  }
}
