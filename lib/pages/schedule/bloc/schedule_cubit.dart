import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/moke/moke.dart';
import 'package:frontend/pages/schedule/bloc/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState(
      selectedDocumentType: documents[0].name)
  );
}
