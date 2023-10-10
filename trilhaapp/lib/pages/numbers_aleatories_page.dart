import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumbersAleatories extends StatefulWidget {
  const NumbersAleatories({super.key});

  @override
  State<NumbersAleatories> createState() => _NumbersAleatoriesState();
}

class _NumbersAleatoriesState extends State<NumbersAleatories> {
  int? generatedNumber = 0;
  int? totalClicks;
  final keyAleatoryNumber = "aleatory_number";
  final keyQuantityClicks = "quantity_clicks";
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    chargeDatas();
  }

  void chargeDatas() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      generatedNumber = storage.getInt("aleatory_number");
      totalClicks = storage.getInt(keyQuantityClicks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Generator of the aleatory numbers"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              generatedNumber == null ? "No one generated number" : generatedNumber.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              totalClicks == null ? "its not clicked" : totalClicks.toString(),
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var random = Random();
          setState(() {
            generatedNumber = random.nextInt(1000);
            totalClicks = (totalClicks ?? 0) + 1;
          });
          storage.setInt(keyAleatoryNumber, generatedNumber!);
          storage.setInt(keyQuantityClicks, totalClicks!);
        },
      ),
    ));
  }
}
