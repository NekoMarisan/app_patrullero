import 'package:flutter/material.dart';
import 'informe_screen.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({super.key});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  String estadoActual = "Pendiente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEN-0003"),
        backgroundColor: const Color(0xFF0B5E2E),
      ),
      body: Column(
        children: [

          // 🔹 MAPA SIMULADO
          SizedBox(
            height: 250,
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 50, color: Colors.black54),
                    SizedBox(height: 10),
                    Text(
                      "Mapa del incidente\nGPS activo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Distancia al incidente: 1.25 km",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [

                  _infoItem("Tipo de Denuncia", "Robo"),
                  _infoItem(
                    "Descripción",
                    "Robo de celular mientras caminaba por la avenida principal.",
                  ),
                  _infoItem("Ubicación", "-17.3895, -66.1568"),
                  _infoItem("Fecha", "28/03/2025 - 12:35 p.m."),
                  _infoItem("Estado", estadoActual),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            estadoActual = "En camino";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(140, 45),
                        ),
                        child: const Text("EN CAMINO"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const InformeScreen(
                                codigoDenuncia: "DEN-0003",
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(140, 45),
                        ),
                        child: const Text("ATENDIDO"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(valor),
        ],
      ),
    );
  }
}
