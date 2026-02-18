import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selectedFilter = "Todas";

  final List<Map<String, dynamic>> denuncias = [
    {
      "codigo": "DEN-0001",
      "fecha": "28/03/2025 - 12:35 p.m.",
      "tipo": "Robo",
      "descripcion": "Robo de celular mientras caminaba por la avenida principal.",
      "ubicacion": "-17.3895, -66.1568",
      "estado": "Pendiente"
    },
    {
      "codigo": "DEN-0002",
      "fecha": "28/03/2025 - 12:35 p.m.",
      "tipo": "Robo",
      "descripcion": "Robo de celular mientras caminaba por la avenida principal.",
      "ubicacion": "-17.3895, -66.1568",
      "estado": "Resuelto"
    },
    {
      "codigo": "DEN-0003",
      "fecha": "28/03/2025 - 12:35 p.m.",
      "tipo": "Robo",
      "descripcion": "Robo de celular mientras caminaba por la avenida principal.",
      "ubicacion": "-17.3895, -66.1568",
      "estado": "En proceso"
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> filtered = selectedFilter == "Todas"
        ? denuncias
        : denuncias.where((d) => d["estado"] == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("DENUNCIAS REALIZADAS"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B5E2E),
      ),
      body: Column(
        children: [

          const SizedBox(height: 10),

          // 🔹 Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton("Todas"),
                _buildFilterButton("En proceso"),
                _buildFilterButton("Pendiente"),
                _buildFilterButton("Resuelto"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 Lista
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final denuncia = filtered[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detalle');
                  },
                  child: _buildDenunciaCard(denuncia),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    final bool isSelected = selectedFilter == text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedFilter = text;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0xFF0B5E2E) : Colors.white,
          foregroundColor:
              isSelected ? Colors.white : const Color(0xFF0B5E2E),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildDenunciaCard(Map<String, dynamic> denuncia) {

    Color estadoColor;

    switch (denuncia["estado"]) {
      case "Pendiente":
        estadoColor = Colors.blue;
        break;
      case "En proceso":
        estadoColor = Colors.orange;
        break;
      case "Resuelto":
        estadoColor = Colors.green;
        break;
      default:
        estadoColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  denuncia["codigo"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: estadoColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    denuncia["estado"],
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),

            const SizedBox(height: 5),

            Text(denuncia["fecha"]),
            const SizedBox(height: 5),
            Text("Tipo: ${denuncia["tipo"]}"),
            const SizedBox(height: 5),
            Text("Ubicación: ${denuncia["ubicacion"]}"),
          ],
        ),
      ),
    );
  }
}
