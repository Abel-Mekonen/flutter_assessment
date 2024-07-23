import 'package:digital_domi_assessment/models/document.dart';
import 'package:digital_domi_assessment/models/file_types.dart';
import 'package:injectable/injectable.dart';

@singleton
class DocumentRepository {
  final List<Document> data = [
    Document("100 Martinique Ave", DateTime.now(), FileType.pdf),
    Document(
        "Chase Bank Statement - November 2023", DateTime.now(), FileType.pdf),
    Document(
        "Backyard Remodel Renderings", DateTime.now(), FileType.spreadsheet),
    Document("Test Document", DateTime.now(), FileType.doc),
    Document("100 Martinique Ave", DateTime.now(), FileType.pdf),
    Document(
        "Chase Bank Statement - November 2023", DateTime.now(), FileType.pdf),
    Document(
        "Backyard Remodel Renderings", DateTime.now(), FileType.spreadsheet),
    Document("Test Document", DateTime.now(), FileType.doc),
  ];
  DocumentRepository();

  Future<List<Document>> getDocumets() async {
    await Future.delayed(const Duration(seconds: 10));
    return Future.value(data);
  }
}
