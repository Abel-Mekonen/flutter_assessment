import 'package:digital_domi_assessment/models/file_types.dart';

class Document {
  final String title;
  final DateTime lastOpenedAt;
  final FileType fileType;
  const Document(this.title, this.lastOpenedAt, this.fileType);
}
