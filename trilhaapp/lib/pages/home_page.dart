import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/random_number_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var quantitiesClick = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App",
        //style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.black45,
                child: Text(
                  "User actions",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: Text(
                  "was clicked $quantitiesClick times",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.lightBlue,
                child: Text(
                  "The generated number was: $generatedNumber",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.amber,
                          child: Text(
                            "Name:",
                            style: GoogleFonts.acme(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Text(
                            "Thiago",
                            style: GoogleFonts.acme(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.cyan,
                          child: Text(
                            "Silva",
                            style: GoogleFonts.acme(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantitiesClick+=1;
              generatedNumber = RandomNumberGeneratorService.generateRandomNumber(1000);
            });
          }),
    );
  }
}
