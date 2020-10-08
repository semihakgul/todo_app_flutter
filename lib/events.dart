
import 'package:flutter/cupertino.dart';

enum EventStatus { all, incompleted, completed, failed, canceled }
int lastId=0;
class Event {
  int id;
  EventStatus status;
  String message;
  Event(this.id, this.message, this.status,);
}

class EventController{
  static List<Event> _eventList = [Event(-1,'Do shopping', EventStatus.incompleted), Event(-2,'Complete the exercises', EventStatus.incompleted),Event(-3,'Finish homework', EventStatus.completed), Event(-4,'Decide on the movie with John', EventStatus.failed), Event(-5,'Cook popcorn for the movie night', EventStatus.canceled)];
  static void addEvent(String message){
    _eventList.add(Event(lastId, message, EventStatus.incompleted));
    lastId++;
  }

  static List<Event> getEventList(EventStatus eventStatus){
    if(eventStatus == EventStatus.all) return _eventList;
    return _eventList.where((element) => element.status == eventStatus).toList();
  }

  static void deleteEvent(int id){

  }
}