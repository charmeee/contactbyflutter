import 'dart:collection';



import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class  viewwithdate extends StatefulWidget {
  viewwithdate({Key? key,this.friend}) : super(key: key);

  var friend;

  @override
  State<viewwithdate> createState() => _viewwithdateState();
}

class _viewwithdateState extends State<viewwithdate> {
  Map<DateTime,List> eventSource={};
  late final ValueNotifier<List> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(getEventsForDay(_selectedDay!));
    for(int i = 0;i < widget.friend.length;i++){
      eventSource[DateTime.parse(widget.friend[i]['meetday'])]=[widget.friend[i]['name']];
    }


  }

  List getEventsForDay(DateTime day) {
    final events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(eventSource);
    return events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;

      });

      _selectedEvents.value = getEventsForDay(selectedDay);
    }
  }
  Widget build(BuildContext context) {






    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.indigo,
        leading: IconButton(
          onPressed: (){Navigator.of(context).pop();},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.friend[0]["meetday"]),
          TableCalendar(
            eventLoader: (day) {
              return getEventsForDay(day);
            },
            focusedDay: _focusedDay,
            firstDay: DateTime(2022,01,01),
            lastDay: DateTime(2022,12,31),
            locale: 'ko-KR',
            daysOfWeekHeight: 30,
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.grey,),
              weekendTextStyle: TextStyle(color: Colors.grey),
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green,width: 1.5)
              ),
              todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}