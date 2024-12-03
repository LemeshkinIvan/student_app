class UpdatedScheduleState{
  String selectedDocumentType;

  UpdatedScheduleState({
    required this.selectedDocumentType
  });

  UpdatedScheduleState copyWith({
    String? selectedDocumentType
  }){
    return UpdatedScheduleState(
        selectedDocumentType : selectedDocumentType ?? this.selectedDocumentType
    );
  }
}