import 'package:flutter/material.dart';
import 'events.dart';

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

class Page extends StatefulWidget {
  final EventStatus eventStatus;

  const Page(this.eventStatus);

  @override
  _PageState createState() => _PageState();
}
class _PageState extends  State<Page>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
            children: EventController.getEventList(widget.eventStatus).map((event) {
          return EventBox(event);
        }).toList())
      ],
    );
  }
}

class EventBox extends StatelessWidget {
  final Event event;
  EventBox(this.event);

  @override
  Widget build(BuildContext context) {
    Color _color;
    switch (event.status) {
      case EventStatus.incompleted:
        {
          _color = Colors.blue;
        }
        break;
      case EventStatus.completed:
        {
          _color = Colors.green;
        }
        break;
      case EventStatus.failed:
        {
          _color = Colors.red;
        }
        break;
      case EventStatus.canceled:
        {
          _color = Colors.grey[350];
        }
        break;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(child: Text(event.message)),
            DropdownButton(
              items: [],
            ),
            Icon(
              Icons.flag,
              color: _color,
            ),
            Icon(
              Icons.delete,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
