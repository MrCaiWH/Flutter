import 'package:event_bus/event_bus.dart';

//Bus初始化
EventBus eventBus = EventBus();

class SelectTaskEvent {
  int value;
  int taskId;
  SelectTaskEvent(int x,int id){
    this.value = x;
    this.taskId = id;
  }
}