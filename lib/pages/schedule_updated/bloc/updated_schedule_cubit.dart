import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/moke/moke.dart';
import 'package:frontend/pages/schedule_updated/bloc/updated_schedule_state.dart';

class UpdatedScheduleCubit extends Cubit<UpdatedScheduleState> {
  UpdatedScheduleCubit() : super(UpdatedScheduleState(
      selectedDocumentType: documents[0].name)
  );
}
