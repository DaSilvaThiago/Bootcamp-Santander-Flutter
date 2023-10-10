// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences storage;
  String? userName;
  double? height;
  bool pushNotification = false;
  bool darkTheme = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final key_user_name = "key_user_name";
  final key_height = "key_height";
  final key_receive_notifications = "key_receive_notifications";
  final key_dark_theme = "key_dark_mode";

  @override
  void initState() {
    super.initState();
    chargeDatas();
  }

  chargeDatas() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      userNameController.text = storage.getString(key_user_name) ?? "";
      heightController.text = (storage.getDouble(key_height) ?? 0).toString();
      pushNotification = storage.getBool(key_receive_notifications) ?? false;
      darkTheme = storage.getBool(key_dark_theme) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(hintText: "User name"),
                  controller: userNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Height"),
                  controller: heightController,
                ),
              ),
              SwitchListTile(
                title: const Text("Receive notifications"),
                value: pushNotification,
                onChanged: (bool value) {
                  setState(() {
                    pushNotification = !pushNotification;
                  });
                },
              ),
              SwitchListTile(
                  title: const Text("Dark theme"),
                  value: darkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      darkTheme = value;
                    });
                  }),
              TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      await storage.setDouble(
                          key_height, double.parse(heightController.text));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("My App"),
                              content: const Text("Please tell a valid height"),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: const Text("OK"))
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setString(
                        key_user_name, userNameController.text);
                    await storage.setBool(
                        key_receive_notifications, pushNotification);
                    await storage.setBool(key_dark_theme, darkTheme);
                    Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ], 
          ),
        ),
      ),
    );
  }
}
