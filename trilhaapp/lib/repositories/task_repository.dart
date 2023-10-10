import 'package:trilhaapp/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<void> add(Task task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> change(String id, bool completed) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((element) => element.id == id).first.completed = completed;
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((element) => element.id == id).first);
  }

  Future<List<Task>> listTasks() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<Task>> noCompletedList() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((element) => !element.completed).toList();
  }
}
