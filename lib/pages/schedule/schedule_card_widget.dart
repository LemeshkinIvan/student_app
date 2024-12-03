import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/pages/schedule/table_headers.dart';
import 'package:frontend/pages/schedule_updated/schedule_updated_page.dart';

class ScheduleCardWidget extends StatelessWidget {
  final List<UpdatedDaySchedule> week;
  final List<String> dayName;
  const ScheduleCardWidget({super.key, required this.week, required this.dayName});

  @override
  Widget build(BuildContext context) {
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
                      child: const TableHeaders(),
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
}
