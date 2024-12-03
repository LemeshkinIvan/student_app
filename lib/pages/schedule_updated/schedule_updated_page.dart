import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/network/dto/response/schedule_response.dart';
import 'package:frontend/pages/schedule/schedule_card_widget.dart';

class ScheduleUpdatedPage extends StatefulWidget {
  const ScheduleUpdatedPage({super.key});

  @override
  State<ScheduleUpdatedPage> createState() => _ScheduleUpdatedPageState();
}

class _ScheduleUpdatedPageState extends State<ScheduleUpdatedPage> {
  ScheduleResponse schedule = ScheduleResponse(
      "Изменения в расписании 4-09ПС-3", "2024-11-21", Uint8List(0));

  List<String> dayName = [
     "Вторник", ];


  UpdatedDaySchedule day_Tuseday = const UpdatedDaySchedule([
    UpdatedSubject("Физкультура", "5", "1.10", "15:15"),
    UpdatedSubject("Математика", "6", "2.22", "16:55"),
    UpdatedSubject("Алгоритмизация", "7", "1.14", "18:25"),
  ]);

  List<UpdatedDaySchedule> week = [];

  @override
  void initState(){
    week.add(day_Tuseday);

    var t = week.length;
    var g = week[0].schedule.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "${schedule.name} от ${schedule.createdAt}",
            style: TextStyle(fontSize: 10.sp),
          ),
          SizedBox(height: 50.h),
          Container(
            color: Colors.redAccent,
            child: Text("Изменения первой пары",
              style: TextStyle(
                  fontSize: 9.sp
              ),
            ),
          ),
          Expanded(
              child: ScheduleCardWidget(week: week, dayName: dayName,)
          )
        ],
      )
    );
  }
}

class UpdatedSubject{
  final String predmet;
  final String time;
  final String room;
  final String predmetTimeNumber;

  const UpdatedSubject(this.predmet, this.predmetTimeNumber, this.room, this.time);
}

class UpdatedDaySchedule{
  final List<UpdatedSubject> schedule;

  const UpdatedDaySchedule(this.schedule);
}