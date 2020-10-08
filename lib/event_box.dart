
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_exercise/events.dart';

class EventBox extends StatelessWidget {
  final Event event;
  final Function setState;

  EventBox(this.event, this.setState);

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
          _color = Colors.redAccent;
        }
        break;
      case EventStatus.canceled:
        {
          _color = Colors.grey[350];
        }
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            GestureDetector(
              onTap: (){
                print('hello');

                EventController.deleteEvent(event.id);
                setState(() {});
              },
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
