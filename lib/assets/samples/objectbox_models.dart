// ignore: unnecessary_import
import 'package:objectbox/objectbox.dart';
import 'objectbox.g.dart';

@Entity()
class Task {
  @Id()
  int id;

  @Index()
  String name;

  bool status;

  final owner = ToOne<Owner>();
  final event = ToOne<Event>();

  Task(this.name, {this.id = 0, this.status = false});

  bool setStatus() {
    status = !status;
    return status;
  }

  @override
  String toString() => name;
}

@Entity()
class Owner {
  @Id()
  int id;
  @Index()
  String name;

  @Backlink('owner')
  final task = ToMany<Task>();

  Owner(this.name, {this.id = 0});

  @override
  String toString() => name;
}

@Entity()
class Event {
  @Id()
  int id;
  @Index()
  String name;
  @Property()
  DateTime? date;
  String? location;

  Event(
    this.name, {
    this.id = 0,
    this.date,
    this.location,
  });

  @Backlink('event')
  final tasks = ToMany<Task>();

  @override
  String toString() => name;
}

class Boxes {
  static String nullString = ' < _ null _ > ';
  late Box<Task> task;
  late Box<Owner> owner;
  late Box<Event> event;

  static late Store _store;
  bool initialized = false;

  static final Boxes _instance = Boxes._internal();
  // using a factory is important for singleton class
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Boxes() {
    return _instance;
  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Boxes._internal();

  get e => null;

  init() async {
    if (!initialized) {
      _store = await openStore();
      task = Box<Task>(_store);
      owner = Box<Owner>(_store);
      event = Box<Event>(_store);
      initialized = true;
      if (task.query(Task_.name.equals(nullString)).build().find().isEmpty) {
        task.put(Task(nullString));
      }
      if (owner.query(Owner_.name.equals(nullString)).build().find().isEmpty) {
        owner.put(Owner(nullString));
      }
      if (event.query(Event_.name.equals(nullString)).build().find().isEmpty) {
        event.put(Event(nullString));
      }
    }
  }

  Store getStore() => _store;

  getByName<T>(String name) {
    Condition<T>? condition;
    switch (T) {
      case Owner:
        condition = Owner_.name.equals(name) as Condition<T>;
        break;
      case Event:
        condition = Event_.name.equals(name) as Condition<T>;
        break;
      case Task:
        condition = Event_.name.equals(name) as Condition<T>;
        break;
      default:
        condition = null;
        break;
    }
    return Box<T>(_store).query(condition).build().find().first;
  }

  int addOwner(String name) => owner.put(Owner(name));

  void addTask(String taskText, Owner theOwner, Event theEvent) {
    Task newTask = Task(taskText);
    theEvent.tasks.add(newTask);
    newTask.owner.target = theOwner;
    newTask.event.target = theEvent;

    owner.put(theOwner);
    task.put(newTask);
    event.put(theEvent);
  }

  void addEvent(String name, DateTime date, String location) {
    Event newEvent = Event(name, date: date, location: location);

    //task is backlink relation tasks, no update here
    event.put(newEvent);
  }

  List<Task> tasksInEvent(Event theEvent) {
    final builder = task.query()..order(Task_.id, flags: Order.descending);
    builder.link(Task_.event, Event_.id.equals(theEvent.id));
    return builder.build().find();
  }
}
