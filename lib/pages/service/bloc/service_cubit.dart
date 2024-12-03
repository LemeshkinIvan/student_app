import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/moke/moke.dart';
import 'package:frontend/pages/service/bloc/service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceState(
      selectedDocumentType: documents[0].name)
  );
}
