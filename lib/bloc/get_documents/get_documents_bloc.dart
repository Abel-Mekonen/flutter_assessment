import 'package:bloc/bloc.dart';
import 'package:digital_domi_assessment/data/document_repository.dart';
import 'package:digital_domi_assessment/models/document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_documents_event.dart';
part 'get_documents_state.dart';
part 'get_documents_bloc.freezed.dart';

@singleton
class GetDocumentsBloc extends Bloc<GetDocumentsEvent, GetDocumentsState> {
  final DocumentRepository _documentRepository;
  GetDocumentsBloc(this._documentRepository) : super(const _Initial()) {
    on<_GetDocuments>(
      (event, emit) async {
        emit(const _Loading());
        try {
          List<Document> response = await _documentRepository.getDocumets();
          emit(_Success(response));
        } catch (e) {
          emit(_Error(e.toString()));
        }
      },
    );
  }
}
