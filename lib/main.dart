import 'package:flutter/material.dart';
import 'events.dart';
import 'page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GeneralLayout(),
    );
  }
}

class GeneralLayout extends StatelessWidget {
  EventController eventController = EventController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.menu),
                    //Text('All'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.crop_square),
                    //Text('Incompleted'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.check),
                    //Text('Completed'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.close),
                    //Text('Failed'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.block),
                    //Text('Canceled'),
                  ],
                ),
              ),
            ],
          ),
          title: Text(
            'TODO or notTODO',
            style: TextStyle(fontFamily: "Roboto"),
          ),
        ),
        body: TabBarView(
          children: [
            Page(EventStatus.all),
            Page(EventStatus.incompleted),
            Page(EventStatus.completed),
            Page(EventStatus.failed),
            Page(EventStatus.canceled),
          ],
        ),
      ),
    );
  }
}

