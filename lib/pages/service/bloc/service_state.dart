class ServiceState{
  String selectedDocumentType;

  ServiceState({
    required this.selectedDocumentType
  });

  ServiceState copyWith({
    String? selectedDocumentType
  }){
    return ServiceState(
        selectedDocumentType : selectedDocumentType ?? this.selectedDocumentType
    );
  }
}