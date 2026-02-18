import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController escalafonController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFF0B5E2E),
              child: Icon(Icons.local_police, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: escalafonController,
              decoration: const InputDecoration(
                labelText: "Número de Escalafón",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  final escalafon = escalafonController.text.trim();
                  final password = passwordController.text.trim();

                  if (escalafon.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Complete todos los campos"),
                      ),
                    );
                    return;
                  }

                  // Aquí luego irá la conexión al backend
                  Navigator.pushReplacementNamed(context, '/home');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B5E2E),
                ),
                child: const Text(
                  "INICIAR SESIÓN",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
