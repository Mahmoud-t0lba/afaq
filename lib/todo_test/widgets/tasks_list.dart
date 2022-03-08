import 'package:afaq/todo_test/widgets/tasks_tile.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      reverse: false,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.horizontal,
          key: UniqueKey(),
          background: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
                const Text(
                  "Delete ?",
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Delete ?",
                  style: TextStyle(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            BotToast.showSimpleNotification(
              title: "To Do List 📝",
              subTitle: 'Deleted the task Succesfully',
              borderRadius: 10.0,
            );
          },
          child: TaskTile(
            taskTitle: 'task',
            isTrue: false,
            longpresscallback: () {
              BotToast.showSimpleNotification(
                title: "To Do List 📝",
                subTitle: 'Deleted the task Succesfully',
                borderRadius: 10.0,
              );
            },
            checkBoxCallBack: (checkBoxState) {},
          ),
        );
      },
    );
  }
}
