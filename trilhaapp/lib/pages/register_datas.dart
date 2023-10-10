import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/service/app_storage_service.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({super.key});

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  var controllerName = TextEditingController(text: "");
  var dateWasBorn = TextEditingController(text: "");
  DateTime? bornedDate;
  var levelRepository = LevelRepository();
  var languagesRepository = LanguageRepository();
  var levels = [];
  var languages = [];
  List<String> selectedLanguages = [];
  var selectedLevel = "";
  double salaryExpectation = 0;
  int timeExperience = 0;
  bool saving = false;
  AppStorageService storage = AppStorageService();
  
  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languagesRepository.returnLanguages();
    super.initState();
    chargeDatas();
  }

  chargeDatas() async {

    controllerName.text = await storage.getRegisterDatasName();
    dateWasBorn.text = await storage.getRegisterDatasBornedDate();
    bornedDate = DateTime.tryParse(dateWasBorn.text);
    selectedLevel = await storage.getRegisterDatasExperienceLevel(); 
    selectedLanguages = await storage.getRegisterDatasLanguages();
    timeExperience = await storage.getRegisterDatasExperienceTime();
    salaryExpectation = await storage.getRegisterDatasSalary();
    setState(() {
      
    });
  }


  List<DropdownMenuItem> returnItens(int maxQuantity) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= maxQuantity; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Datas"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: saving
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(text: "Name"),
                  TextField(
                    controller: controllerName,
                  ),
                  const TextLabel(text: "Born date"),
                  TextField(
                    controller: dateWasBorn,
                    readOnly: true,
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 5, 20),
                          lastDate: DateTime(2023, 10, 23));
                      if (date != null) {
                        dateWasBorn.text = date.toString();
                        bornedDate = date;
                      }
                    },
                  ),
                  const TextLabel(text: "Level experience"),
                  Column(
                      children: levels
                          .map((level) => RadioListTile(
                              title: Text(level.toString()),
                              selected: selectedLevel == level,
                              value: level.toString(),
                              groupValue: selectedLevel,
                              onChanged: (value) {
                                setState(() {
                                  selectedLevel = value.toString();
                                });
                              }))
                          .toList()),
                  const TextLabel(text: "Favorite Languages"),
                  Column(
                      children: languages
                          .map((language) => CheckboxListTile(
                              title: Text(language),
                              value: selectedLanguages.contains(language),
                              onChanged: (value) {
                                if (value!) {
                                  setState(() {
                                    selectedLanguages.add(language);
                                  });
                                } else {
                                  setState(() {
                                    selectedLanguages.remove(language);
                                  });
                                }
                              }))
                          .toList()),
                  const TextLabel(text: "Time experience"),
                  DropdownButton(
                      value: timeExperience,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          timeExperience = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      text:
                          "Salary expectation. R\$ ${salaryExpectation.round()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salaryExpectation,
                      onChanged: (double value) {
                        setState(() {
                          salaryExpectation = value;
                        });
                        debugPrint(value.toString());
                      }),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        saving = false;
                      });
                      if (controllerName.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("The name must be filled")));
                        return;
                      }
                      if (bornedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid born date")));
                        return;
                      }
                      if (selectedLevel.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("The level must be selected")));
                        return;
                      }
                      if (selectedLanguages.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Must be selected least one language")));
                        return;
                      }
                      await storage.setRegisterDatasName(controllerName.text);
                      await storage.setRegisterDatasBornedDate(bornedDate!);
                      await storage.setRegisterDatasExperienceLevel(selectedLevel);
                      await storage.setRegisterDatasLanguages(selectedLanguages);
                      await storage.setRegisterDatasExperienceTime(timeExperience);
                      await storage.setRegisterDatasSalary(salaryExpectation);

                      setState(() {
                        saving = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Datas saved with success")));
                        setState(() {
                          saving = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("Save"),
                  )
                ],
              ),
      ),
    );
  }
}
