import 'package:flutter/material.dart';

class Servicios extends StatefulWidget {
  const Servicios({super.key});

  @override
  State<Servicios> createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {

  String filtro = "Dia";

  final List servicios = [
    {
      "servicio": "Reparación eléctrica",
      "cliente": "Juan Pérez",
      "fecha": "10 Mar 2026",
      "precio": "\$40.000",
      "estado": "Completado"
    },
    {
      "servicio": "Limpieza hogar",
      "cliente": "Ana López",
      "fecha": "09 Mar 2026",
      "precio": "\$50.000",
      "estado": "Pendiente"
    },
    {
      "servicio": "Soporte PC",
      "cliente": "Carlos Díaz",
      "fecha": "05 Mar 2026",
      "precio": "\$35.000",
      "estado": "Completado"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8F7),

      appBar: AppBar(
        title: const Text("Mis Servicios"),
        backgroundColor: const Color(0xFF235347),
        centerTitle: true,
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          /// FILTROS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              filtroChip("Dia"),
              filtroChip("Semana"),
              filtroChip("Mes"),
            ],
          ),

          const SizedBox(height: 15),

          /// LISTA SERVICIOS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: servicios.length,
              itemBuilder: (context, index) {

                final servicio = servicios[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [

                        /// ICONO
                        const CircleAvatar(
                          backgroundColor: Color(0xFF235347),
                          child: Icon(Icons.build, color: Colors.white),
                        ),

                        const SizedBox(width: 15),

                        /// INFO SERVICIO
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                servicio["servicio"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "Cliente: ${servicio["cliente"]}",
                                style: const TextStyle(color: Colors.grey),
                              ),

                              Text(
                                "Fecha: ${servicio["fecha"]}",
                                style: const TextStyle(color: Colors.grey),
                              ),

                            ],
                          ),
                        ),

                        /// PRECIO Y ESTADO
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text(
                              servicio["precio"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF235347),
                              ),
                            ),

                            const SizedBox(height: 5),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: servicio["estado"] == "Completado"
                                    ? Colors.green
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                servicio["estado"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),

                          ],
                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget filtroChip(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ChoiceChip(
        label: Text(texto),
        selected: filtro == texto,
        selectedColor: const Color(0xFF235347),
        labelStyle: TextStyle(
          color: filtro == texto ? Colors.white : Colors.black,
        ),
        onSelected: (bool selected) {
          setState(() {
            filtro = texto;
          });
        },
      ),
    );
  }
}