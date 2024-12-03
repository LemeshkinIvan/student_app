import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/network/dto/response/schedule_response.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  ScheduleResponse schedule = ScheduleResponse(
      "Постоянное расписание 4-09ПС-3", "2024-08-24", Uint8List(0));

  List<String> dayName = [
    "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"];

  DaySchedule day_Monday = const DaySchedule([
    Subject("Программирование", "5", "3.19", "15:15"),
    Subject("Экономика", "6", "2.22", "16:55"),
    Subject("История", "7", "1.14", "18:25"),
  ]);

  DaySchedule dayTuesday = const DaySchedule([
    Subject("Английский", "5", "3.19", "15:15"),
    Subject("Математика", "6", "2.22", "16:55"),
    Subject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  DaySchedule dayWednesday = const DaySchedule([
    Subject("Философия", "5", "3.19", "15:15"),
    Subject("Математика", "6", "2.22", "16:55"),
    Subject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  DaySchedule dayThursty = const DaySchedule([
    Subject("Право", "5", "3.19", "15:15"),
    Subject("Математика", "6", "2.22", "16:55"),
    Subject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  DaySchedule dayFriday = const DaySchedule([
    Subject("Физкультура", "5", "3.19", "15:15"),
    Subject("Физкультура", "6", "2.22", "16:55"),
    Subject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  DaySchedule daySaturday = const DaySchedule([
    Subject("Конфигурирование 1с", "5", "3.19", "15:15"),
    Subject("Математика", "6", "2.22", "16:55"),
    Subject("Базы данных", "7", "1.14", "18:25"),
  ]);

  DaySchedule daySunday = const DaySchedule([
    Subject("Английский", "5", "3.19", "15:15"),
    Subject("Математика", "6", "2.22", "16:55"),
    Subject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  List<DaySchedule> week = [];

  @override
  void initState(){
    week.add(day_Monday,);
    week.add(dayTuesday);
    week.add(dayWednesday);
    week.add(dayThursty);
    week.add(dayFriday);
    week.add(dayThursty);

    var t = week.length;
    var g = week[0].schedule.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${schedule.name} от ${schedule.createdAt}", style: TextStyle(fontSize: 10.sp),),
          SizedBox(height: 50.h),
          Expanded(child: buildCardSchedule())
        ],
      )
    );
  }

  Widget buildCardSchedule(){
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 165.h,
          vertical: 10.w
        ),
        itemCount: week.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
        var schedule = week[index].schedule;
        return ListTile(
          title: Column(
            children: [
              Container(
                color: Colors.yellowAccent,
                child: Text(dayName[index], style: TextStyle(fontSize: 11.sp)),
              ),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Container(
                  color: Colors.greenAccent,
                  child: buildHeaders(),
                ),
              ),
              Column(
                children: List.generate(schedule.length, (index){
                  return SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w
                                ),
                                child: Text(
                                    schedule[index].time,
                                    style: TextStyle(fontSize: 8.sp)
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.w
                                    ),
                                    child: Text(
                                        schedule[index].predmet,
                                        style: TextStyle(fontSize: 8.sp)
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 44.w
                                    ),
                                    child: Text(
                                        schedule[index].room,
                                        style: TextStyle(fontSize: 8.sp)
                                    ),
                                  )
                              )
                            ],
                          )
                        ],
                      )
                  );
                }
                ),
              )
            ],
          )
        );
      }
    );
  }

  Widget buildHeaders(){
    return Row(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.w
          ),
          child: Text(
              "Время начала",
              style: TextStyle(fontSize: 8.sp)
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 13.w
              ),
              child: Text(
                  "Предмет",
                  style: TextStyle(fontSize: 8.sp)
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 25.w
              ),
              child: Text(
                  "Кабинет",
                  style: TextStyle(fontSize: 8.sp)
              ),
            )
        )
      ],
    );
  }
}


class Subject{
  final String predmet;
  final String time;
  final String room;
  final String predmetTimeNumber;

  const Subject(this.predmet, this.predmetTimeNumber, this.room, this.time);
}

class DaySchedule{
  final List<Subject> schedule;

  const DaySchedule(this.schedule);
}