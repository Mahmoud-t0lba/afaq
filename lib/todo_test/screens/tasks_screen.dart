// ignore_for_file: camel_case_types

import 'package:afaq/todo_test/screens/add_task_screen.dart';
import 'package:afaq/todo_test/screens/custom_dialog.dart';
import 'package:afaq/todo_test/widgets/tasks_list.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Tasks_Screen extends StatelessWidget {
  const Tasks_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Check All'),
              enabled: true,
              onTap: () {
                checkAll(context);
              },
            ),
            ListTile(
              onTap: () {
                uncheckAll(context);
              },
              leading: const Icon(Icons.check_box_outline_blank_rounded),
              title: const Text('UnCheck All'),
            ),
            ListTile(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "To Do List 📝",
                  desc:
                      'This is irreversible, you might end up losing all your tasks listed here.\n Are you sure ?',
                  buttons: [
                    DialogButton(
                      child: const Text(
                        "NO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: const Text(
                        "YES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        dAll(context);
                      },
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
              leading: const Icon(Icons.delete),
              title: const Text('Delete All'),
            ),
            const ListTile(
              onTap: null,
              leading: Icon(Icons.color_lens_sharp),
              title: Text('Change Theme'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomDialogBox(
                        title: "To Do",
                        descriptions:
                            ' 📝 A simple ad free To Do App\n 📝 Press the add icon button to add a task\n 📝swipe left or right on any task to delete\n 📝Check or Uncheck any task\n 📝Delete all task at once\n 📝Check all tasks at once \n 📝Customize your own theme',
                        text: "Check GitHub",
                      );
                    });
              },
              leading: const Icon(Icons.info),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kDebugMode) {
            print('button pressed');
          }
          showModalBottomSheet(
              context: context, builder: (context) => const Add_Task_screen());
        },
        elevation: 12.0,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 0.0, left: 30, right: 30.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/afaq-logo.png",
                        height: 100,
                        width: 100,
                      ),
                      const Text(
                        "To Do",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: 2.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: const TasksWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void dAll(BuildContext context) {
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task Deleted Succesfully ',
    borderRadius: 5.0,
  );
  Navigator.pop(context);
}

void checkAll(BuildContext context) {
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task Checked Succesfully ',
    borderRadius: 5.0,
  );
  Navigator.pop(context);
}

void uncheckAll(BuildContext context) {
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task UnChecked Succesfully ',
    borderRadius: 5.0,
  );
  Navigator.pop(context);
}
