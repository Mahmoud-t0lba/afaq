import 'package:afaq/home.dart';
import 'package:afaq/notification/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffD3BA7B),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            onPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MyHomePage(),
              //   ),
              // );
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return const NotificationCard(
                    description:
                        'des des des des des des des des des dse dse des des',
                    time: '8 Min Ago',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
