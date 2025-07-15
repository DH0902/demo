import 'package:demo/extensions/context_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FileHelper {
  static Future<void> showImportDialog(
    BuildContext context,
    String userType,
  ) async {
    FilePickerResult? pickedFile;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: context.screenWidth * 0.6,
              height: context.screenHeight * 0.5,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Import $userType by CSV",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          Tooltip(
                            message: 'Upload a CSV file with $userType data.',
                            child: Icon(Icons.info_outline, size: 18),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['csv'],
                      );
                      if (result != null) {
                        setState(() => pickedFile = result);
                      }
                    },
                    child: DottedBorder(
                      dashPattern: [6, 4],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(8),
                      color: Colors.grey.shade400,
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: pickedFile == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.upload_file,
                                      color: Colors.grey, size: 28),
                                  SizedBox(height: 8),
                                  Text('+ Add file',
                                      style: TextStyle(
                                          color: Colors.grey.shade700)),
                                ],
                              )
                            : Text(pickedFile!.files.first.name),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Sample link
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () async {
                        const url =
                            'https://yourdomain.com/sample.csv'; // Replace this
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        }
                      },
                      child: Text(
                        'Download a sample CSV',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: pickedFile == null
                            ? null
                            : () {
                                // TODO: Handle import logic
                                Navigator.of(context).pop();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pickedFile == null
                              ? Colors.grey.shade300
                              : Colors.blue,
                          foregroundColor:
                              pickedFile == null ? Colors.grey : Colors.white,
                        ),
                        child: Text('Import $userType'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
