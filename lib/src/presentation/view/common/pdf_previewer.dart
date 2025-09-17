// Flutter imports:
import 'package:flutter_application_bloc/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'custom_error_widget.dart';

class PDFPreview extends StatefulWidget {
  final String? url, name;
  const PDFPreview({super.key, required this.url, this.name});

  @override
  State<PDFPreview> createState() => _PDFPreviewState();
}

class _PDFPreviewState extends State<PDFPreview> {
  @override
  Widget build(BuildContext context) {
    return PDF(
      onError:
          (error) => CustomErrorWidget(
            message: error.error!.message!,
            btnTitle: context.localText.button_retry_title,
            onTab: () => setState(() {}),
            showImage: true,
          ),
    ).cachedFromUrl(
      widget.url!,
      placeholder:
          (progress) => Center(
            child: Chip(
              label: Text(
                '$progress %',
                style: context.bodyL!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.scheme.secondary,
                ),
              ),
            ),
          ),
      errorWidget:
          (error) => CustomErrorWidget(
            message: error.error!.message!,
            btnTitle: context.localText.button_retry_title,
            onTab: () => setState(() {}),
          ),
    );
  }
}
