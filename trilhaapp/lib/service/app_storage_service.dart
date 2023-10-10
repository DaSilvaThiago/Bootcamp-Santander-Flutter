// ignore_for_file: constant_identifier_names, camel_case_types, unused_element

import 'package:shared_preferences/shared_preferences.dart';

enum storage_key {
  key_register_datas_name,
  key_register_datas_born_date,
  key_register_datas_experience,
  key_register_datas_languages,
  key_register_datas_experience_time,
  key_register_datas_salary,
}

class AppStorageService {
  Future<void> setRegisterDatasName(String name) async {
    await _setString(storage_key.key_register_datas_name.toString(), name);
  }

  Future<String> getRegisterDatasName() async {
    return _getString(storage_key.key_register_datas_name.toString());
  }

  Future<void> setRegisterDatasBornedDate(DateTime date) async {
    await _setString(
        storage_key.key_register_datas_born_date.toString(), date.toString());
  }

  Future<String> getRegisterDatasBornedDate() async {
    return _getString(storage_key.key_register_datas_born_date.toString());
  }

  Future<void> setRegisterDatasExperienceLevel(String experience) async {
    await _setString(
        storage_key.key_register_datas_experience.toString(), experience);
  }

  Future<String> getRegisterDatasExperienceLevel() async {
    return _getString(storage_key.key_register_datas_experience.toString());
  }

  Future<void> setRegisterDatasLanguages(List<String> languages) async {
    await _setStringList(
        storage_key.key_register_datas_languages.toString(), languages);
  }

  Future<List<String>> getRegisterDatasLanguages() async {
    return _getStringList(storage_key.key_register_datas_languages.toString());
  }

  Future<void> setRegisterDatasExperienceTime(int value) async {
    await _setInt(storage_key.key_register_datas_experience_time.toString(), value);
  }

  Future<int> getRegisterDatasExperienceTime() async {
    return _getInt(storage_key.key_register_datas_experience_time.toString());
  }

  Future<void> setRegisterDatasSalary(double value) async {
  await _setDouble(storage_key.key_register_datas_salary.toString(), value);
  }

  Future<double> getRegisterDatasSalary() async {
    return _getDouble(storage_key.key_register_datas_salary.toString());
  }

  Future<void> _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  Future<void> _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  Future<void> _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

  Future<void> _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  Future<void> _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }
}
