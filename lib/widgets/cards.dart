import 'package:digital_domi_assessment/models/document.dart';
import 'package:digital_domi_assessment/models/file_types.dart';
import 'package:digital_domi_assessment/utils/formatters.dart';
import 'package:digital_domi_assessment/widgets/buttons.dart';
import 'package:flutter/material.dart';

class FileItemTile extends StatelessWidget {
  final Document document;

  const FileItemTile({
    super.key,
    required this.document,
  });

  Widget fileTypeToIcon(FileType fileType) {
    switch (fileType) {
      case FileType.doc:
        return const Icon(Icons.description, color: Colors.blue, size: 30);
      case FileType.pdf:
        return const Icon(Icons.picture_as_pdf, color: Colors.red, size: 30);
      case FileType.spreadsheet:
        return const Icon(Icons.table_chart, color: Colors.green, size: 30);
      default:
        return const Icon(Icons.insert_drive_file, size: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 40, 39, 39), // Background color of the container
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          fileTypeToIcon(document.fileType),
          const SizedBox(width: 16.0), // Spacing between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  document.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 4.0), // Spacing between title and subtitle
                Text(
                  "Opened ${formatDate(document.lastOpenedAt)}",
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InviteCard extends StatelessWidget {
  const InviteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Invite & Earn",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ))
            ],
          ),
          Flexible(
            child: Text(
              "Invite your neighbor and you both recieve \$10 when they claim their address.",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(height: 20),
          AppButton(title: "Send Invite", onPressed: () {})
        ],
      ),
    );
  }
}
