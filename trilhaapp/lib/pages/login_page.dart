import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 209, 241, 171),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Icon(
                Icons.person,
                size: 155,
                color: Color.fromARGB(186, 0, 0, 0),
                ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text("Formless your Email:")
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("Email")
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text("Formless your Password:")
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("Password")
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 160, 189, 172),
                height: 30,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.centerRight,
                child: const Text("Register"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
