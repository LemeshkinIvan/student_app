import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/document/bloc/document_library_state.dart';
import 'package:frontend/pages/moke/moke.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentState(
      selectedDocumentType: documents[0].name));

  void setSelectedDocumentType(String type){
    emit(state.copyWith(selectedDocumentType: type));
  }

  String getSelectedDocumentType(){
    return state.selectedDocumentType;
  }
}
