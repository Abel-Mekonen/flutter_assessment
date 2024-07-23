part of 'get_documents_bloc.dart';

@freezed
class GetDocumentsState with _$GetDocumentsState {
  const factory GetDocumentsState.initial() = _Initial;
  const factory GetDocumentsState.loading() = _Loading;
  const factory GetDocumentsState.success(List<Document> documents) = _Success;
  const factory GetDocumentsState.error(String message) = _Error;
}
