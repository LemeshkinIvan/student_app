import 'dart:typed_data';

class ScheduleResponse{
  final String name;
  final String createdAt;
  final Uint8List content;

  const ScheduleResponse(this.name, this.createdAt, this.content);
}