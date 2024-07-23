part of 'get_documents_bloc.dart';

@freezed
class GetDocumentsEvent with _$GetDocumentsEvent {
  const factory GetDocumentsEvent.started() = _Started;
  const factory GetDocumentsEvent.getDocuments() = _GetDocuments;
}
