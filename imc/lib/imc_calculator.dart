import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                          Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 30,
                          alignment: Alignment.center,
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 0),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white12)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white12)),
                                hintText: "E-mail",
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 140, 102, 172),
                                )),
                          )),
                        ],
      ),
    );
  }
}