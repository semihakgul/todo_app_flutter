
import 'package:flutter/cupertino.dart';

enum EventStatus { all, incompleted, completed, failed, canceled }

class Event {

  EventStatus status;
  String message;
  Event( this.message, this.status,);
}

class EventController{
  static List<Event> _eventList = [Event('Do shopping', EventStatus.incompleted), Event('Complete the exercises', EventStatus.incompleted),Event('Finish homework', EventStatus.completed), Event('Decide on the movie with John', EventStatus.failed), Event('Cook popcorns for the movie night', EventStatus.canceled)];
  void addEvent(String message){
    _eventList.add(Event(message, EventStatus.incompleted));
  }

  static List<Event> getEventList(EventStatus eventStatus){
    if(eventStatus == EventStatus.all) return _eventList;
    return _eventList.where((element) => element.status == eventStatus).toList();
  }

}