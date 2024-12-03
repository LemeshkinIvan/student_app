import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend/common/values/colors.dart';
import 'package:frontend/common/widgets/modal.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentViewerModal extends StatelessWidget {
  const DocumentViewerModal({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDefaultModal(context, SfPdfViewerTheme(
        data: SfPdfViewerThemeData (
            progressBarColor: AppColors.green1,
            backgroundColor: AppColors.white
        ),
        child: SfPdfViewer.memory (
          Uint8List(0),
          pageLayoutMode: PdfPageLayoutMode.continuous,
        )
      )
    );
  }
}
