import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/auth/bloc/auth_state.dart';
import 'package:frontend/pages/moke/moke.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(
      selectedDocumentType: documents[0].name)
  );
}
