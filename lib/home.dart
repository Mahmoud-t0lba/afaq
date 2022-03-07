// ignore_for_file: avoid_print

import 'package:afaq/notification/notification_view.dart';
import 'package:afaq/screens.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String afaqHome = 'https://afaq2022gp.com';
  String afaqMorshhen = 'https://afaq2022gp.com';
  String afaqAhdafElhamla = 'https://afaq2022gp.com';
  String afaqMorshhenNews = 'https://afaq2022gp.com';
  String afaqContactUs = 'https://afaq2022gp.com';

  ////////////////////////////////////////
  String afaqUrl = 'https://afaq2022gp.com';

  late WebViewController controller;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getToken().then((value) =>
        print('===========================$value==========================='));
    FirebaseMessaging.instance.subscribeToTopic('all');
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: true,
    );

    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //todo change
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                //pushReplacement
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Color(0xffD3BA7B),
              size: 30,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TabBar(
                labelStyle: TextStyle(fontSize: 22),
                isScrollable: true,
                indicatorColor: Color(0xffD3BA7B),
                labelColor: Color(0xffD3BA7B),
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text('الرئيسية'),
                  ),
                  Tab(
                    child: Text('المرشحين'),
                  ),
                  Tab(
                    child: Text('اهداف الحملة'),
                  ),
                  Tab(
                    child: Text('اخبار المرشحين'),
                  ),
                  Tab(
                    child: Text('التواصل معنا'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AfaqHome(url: afaqHome),
            AfaqMorshhen(url: afaqMorshhen),
            AfaqAhdafElhamla(url: afaqAhdafElhamla),
            AfaqMorshhenNews(url: afaqMorshhenNews),
            AfaqContactUs(url: afaqContactUs),
          ],
        ),
      ),
    );
  }
}
