import 'package:flutter/material.dart';

class InformeScreen extends StatefulWidget {
  final String codigoDenuncia;

  const InformeScreen({
    super.key,
    required this.codigoDenuncia,
  });

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController descripcionController =
      TextEditingController();

  final TextEditingController accionController =
      TextEditingController();

  final TextEditingController conclusionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informe ${widget.codigoDenuncia}"),
        backgroundColor: const Color(0xFF0B5E2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              const Text(
                "Descripción de los hechos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: descripcionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Describa lo ocurrido...",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),

              const SizedBox(height: 20),

              const Text(
                "Acciones realizadas",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: accionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Procedimientos efectuados...",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),

              const SizedBox(height: 20),

              const Text(
                "Conclusión / Derivación",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: conclusionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      "Ej: Caso derivado a FELCC para investigación",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Informe enviado correctamente"),
                      ),
                    );

                    // Regresa a Home eliminando pantallas anteriores
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B5E2E),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Enviar Informe"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
