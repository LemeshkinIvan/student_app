class AuthState{
  String selectedDocumentType;

  AuthState({
    required this.selectedDocumentType
  });

  AuthState copyWith({
    String? selectedDocumentType
  }){
    return AuthState(
        selectedDocumentType : selectedDocumentType ?? this.selectedDocumentType
    );
  }
}