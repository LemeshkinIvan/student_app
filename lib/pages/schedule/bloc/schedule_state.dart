class ScheduleState{
  String selectedDocumentType;

  ScheduleState({
    required this.selectedDocumentType
  });

  ScheduleState copyWith({
    String? selectedDocumentType
  }){
    return ScheduleState(
        selectedDocumentType : selectedDocumentType ?? this.selectedDocumentType
    );
  }
}