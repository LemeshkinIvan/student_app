class DocumentState{
  String selectedDocumentType;

  DocumentState({
    required this.selectedDocumentType
  });

  DocumentState copyWith({
    String? selectedDocumentType
  }){
    return DocumentState(
        selectedDocumentType : selectedDocumentType ?? this.selectedDocumentType
    );
  }
}