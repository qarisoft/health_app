import 'package:flutter/material.dart';

import '../../ex.dart' show AppEx;

/// The Search Input Dialog
class SingleInputDialog extends StatefulWidget {
  const SingleInputDialog({
    super.key,
    this.title = '',
    this.label = '',
    this.initialValue,
  });

  final String title;
  final String label;
  final String? initialValue;

  @override
  State<SingleInputDialog> createState() => _SingleInputDialogState();
}

class _SingleInputDialogState extends State<SingleInputDialog> {
  final TextEditingController _controller = TextEditingController();

  // late final String title;

  // _SingleInputDialogState();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,

        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onSubmitted: (val) => Navigator.pop(context, val),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: Text(context.tr.submit),
        ),
      ],
    );
  }
}
