import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Task {
  String title;
  bool isDone;

  Task(this.title, {this.isDone = false});
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
      
    );
  }
  }


class ToDoList extends StatefulWidget {
  const ToDoList({super.key});  

  @override 
  State<ToDoList> createState() => ToDoListState(); 
}

class ToDoListState extends State<ToDoList> {
  final List<Task> task = [];
  final TextEditingController taskController = TextEditingController();



  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        task.add(Task(taskController.text));
        taskController.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      task.removeAt(index);
    });
  }




void handleToDoChange(Task task) {
  setState(() {
    task.isDone = !task.isDone;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(labelText: 'Enter a task'),
              style: const TextStyle(fontSize: 18.0, color: Colors.black),
              
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(onPressed:(){
            if(taskController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter a task')),
              );
            } else {
              addTask();
            }
          }, child: const Text('Add Task')),
          SizedBox(height: 10.0),
          
          Padding(padding:  EdgeInsets.only(left: 30.0, right: 30.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(task[index].title,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  tileColor: Colors.white,
                  leading: Icon(
                   task[index].isDone ? Icons.check_box : Icons.check_box_outline_blank,
                    color: task[index].isDone ? Colors.green : Colors.grey,
                  ),
                  onTap: () => handleToDoChange(task[index]),            
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
