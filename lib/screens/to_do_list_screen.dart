import 'package:flutter/material.dart';
import 'package:todoapp/util/to_do_list_widget.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  TextEditingController taskAddCont = TextEditingController();
  TextEditingController taskeditCont = TextEditingController();
  List toDoList = [];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      toDoList.add([taskAddCont.text, false]);
      taskAddCont.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  editTask(int index) {
    // Clear the text controller before setting new text
    taskeditCont.clear();
    // Set the text of the controller to the current task text
    taskeditCont.text = toDoList[index][0];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
            content: TextField(
              controller: taskeditCont,
              decoration: const InputDecoration(
                hintText: 'Edit Your Text',
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      toDoList[index][0] = taskeditCont.text;
                    });
                  },
                  child: const Text('Edit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 0, 35, 150)])),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 280,
                    child: TextField(
                      controller: taskAddCont,
                      decoration: InputDecoration(
                        hintText: 'Enter A Task',
                        hintStyle: const TextStyle(color: Colors.white30),
                        fillColor: Colors.white10,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)),
                      ),
                    )),
                FloatingActionButton(
                  onPressed: saveTask,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ), //TextField & Elevated Button
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ToDoListWidget(
                  taskName: toDoList[index][0],
                  taskStatus: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: (context) => deleteTask(index),
                  editFunction: (context) => editTask(index),
                );
              },
              itemCount: toDoList.length,
            ),
          )
        ],
      ),
    );
  }
}
