// ignore_for_file: camel_case_types, unnecessary_null_comparison

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Add_Task_screen extends StatelessWidget {
  const Add_Task_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    // bool isdone = false;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(
            left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add a new task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Colors.teal,
              ),
            ),
            CupertinoTextField(
              textCapitalization: TextCapitalization.sentences,
              scrollPhysics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
              onSubmitted: (newTaskTitle) {
                if (newTaskTitle != "") {
                  BotToast.showSimpleNotification(
                    title: "To Do List 📝",
                    subTitle: 'Added the task Succesfully ',
                    borderRadius: 5.0,
                  );
                  Navigator.pop(context);
                  if (kDebugMode) {
                    print(newTaskTitle);
                  }
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.teal,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (newTaskTitle == null) {
                    Navigator.pop(context);
                  } else {
                    BotToast.showSimpleNotification(
                      title: "To Do List",
                      subTitle: 'Added the task Succesfully',
                      borderRadius: 5.0,
                    );
                    Navigator.pop(context);
                    if (kDebugMode) {
                      print(newTaskTitle);
                    }
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
