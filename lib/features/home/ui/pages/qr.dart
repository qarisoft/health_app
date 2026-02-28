import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageFromDataUrl extends StatelessWidget {
  final String dataUrl;

  const ImageFromDataUrl({super.key, required this.dataUrl});

  Uint8List _dataUrlToBytes(String dataUrl) {
    final stripped = dataUrl.replaceFirst(
      RegExp(r'data:image/[^;]+;base64,'),
      '',
    );
    return base64.decode(stripped);
  }

  @override
  Widget build(BuildContext context) {
    try {
      Uint8List bytes = _dataUrlToBytes(dataUrl);
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey,
            child: Center(child: Text('Failed to load image')),
          );
        },
      );
    } catch (e) {
      return Container(
        color: Colors.grey,
        child: Center(child: Text('Invalid image data')),
      );
    }
  }
}

// Usage:
// ImageFromDataUrl(dataUrl: "data:image/png;base64,iVBORw0KGgo...")
