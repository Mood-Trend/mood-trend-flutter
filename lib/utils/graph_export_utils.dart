import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:intl/intl.dart';

enum ExportFormat {
  pdf,
  png,
}

class GraphExportUtils {
  static final ScreenshotController _screenshotController = ScreenshotController();

  /// Captures a widget as an image
  static Future<Uint8List?> captureWidget(Widget widget) async {
    return await _screenshotController.captureFromWidget(
      widget,
      delay: const Duration(milliseconds: 100),
      pixelRatio: 2.0,
    );
  }

  /// Exports a widget as PDF or PNG and saves to device
  static Future<String?> exportWidgetAs({
    required Widget widget,
    required ExportFormat format,
    String? title,
  }) async {
    // Capture the widget as an image
    final imageBytes = await captureWidget(widget);
    if (imageBytes == null) return null;

    // Get the documents directory
    final directory = await getApplicationDocumentsDirectory();
    final dateTime = DateTime.now();
    final dateTimeString = DateFormat('yyyyMMdd_HHmmss').format(dateTime);
    
    // Create filename with date and time
    final fileName = title != null 
        ? '${title}_$dateTimeString' 
        : 'mood_trend_$dateTimeString';
    
    // Handle based on format
    if (format == ExportFormat.pdf) {
      return await _exportAsPdf(imageBytes, directory.path, fileName);
    } else {
      return await _exportAsPng(imageBytes, directory.path, fileName);
    }
  }

  /// Exports the image as PDF and saves to device
  static Future<String?> _exportAsPdf(
    Uint8List imageBytes, 
    String directoryPath, 
    String fileName
  ) async {
    // Create a PDF document
    final pdf = pw.Document();
    
    // Convert the image bytes to a PDF image
    final image = pw.MemoryImage(imageBytes);
    
    // A4 size in portrait orientation
    final pageFormat = PdfPageFormat.a4;
    
    // Add a page with the image fitted to the page
    pdf.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image, fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    
    // Save the PDF file
    final file = File('$directoryPath/$fileName.pdf');
    await file.writeAsBytes(await pdf.save());
    
    return file.path;
  }

  /// Exports the image as PNG and saves to device
  static Future<String?> _exportAsPng(
    Uint8List imageBytes, 
    String directoryPath, 
    String fileName
  ) async {
    // Save the PNG file
    final file = File('$directoryPath/$fileName.png');
    await file.writeAsBytes(imageBytes);
    
    return file.path;
  }
}
