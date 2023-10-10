// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task.dart';
import 'package:trilhaapp/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var taskRepository = TaskRepository();
  var _tasks = const <Task>[];
  var desciptionController = TextEditingController();
  var onlyNotCompleted = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    if (onlyNotCompleted) {
      _tasks = await taskRepository.noCompletedList();
    } else {
      _tasks = await taskRepository.listTasks();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            desciptionController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("add task"),
                    content: TextField(
                      controller: desciptionController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      TextButton(
                          onPressed: () async {
                            await taskRepository
                                .add(Task(desciptionController.text, false));
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: const Text("Save")),
                    ],
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "only not completed",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                      value: onlyNotCompleted,
                      onChanged: (bool value) {
                        onlyNotCompleted = value;
                        getTasks();
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var task = _tasks[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async {
                        await taskRepository.remove(task.id);
                        getTasks();
                      },
                      key: Key(task.id),
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                            onChanged: (bool value) async {
                              await taskRepository.change(task.id, value);
                              getTasks();
                            },
                            value: task.completed),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
