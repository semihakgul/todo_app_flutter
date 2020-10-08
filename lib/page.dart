
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_exercise/event_box.dart';
import 'package:flutter_bloc_exercise/events.dart';

class Page extends StatefulWidget {
  final EventStatus eventStatus;

  const Page({Key key, this.eventStatus}) : super(key: key);



  @override
  _PageState createState() => _PageState();
}
class _PageState extends  State<Page>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: FlatButton(
              child: Text('add event'),
              onPressed: (){
                setState(() {
                  EventController.addEvent('message');
                });
              },
            ),
          ),
          Column(
              children: EventController.getEventList(widget.eventStatus).map((event) {
                return EventBox(event, setState);
              }).toList())
        ],
      ),
    );
  }
}