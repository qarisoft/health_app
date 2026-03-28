import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/server_health_provider.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
// Note: Ensure you import your Riverpod/Consumer, appStorage, and CustomTextField as needed.

class EnterApiUrlDialog extends StatefulWidget {
  const EnterApiUrlDialog({super.key});

  @override
  State<EnterApiUrlDialog> createState() => _EnterApiUrlDialogState();
}

class _EnterApiUrlDialogState extends State<EnterApiUrlDialog> {
  final _formKey = GlobalKey<FormState>();
  final _hostController = TextEditingController();
  final _portController = TextEditingController();

  // New state variables for the schema and port toggle
  String _schema = 'https://';
  bool _usePort = false;

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    final savedUrl = appStorage.getString(apiUrlKey);

    if (savedUrl != null && savedUrl.isNotEmpty) {
      // 1. Strip the '/api' path we appended during save
      final cleanUrl = savedUrl.endsWith('/api')
          ? savedUrl.substring(0, savedUrl.length - 4)
          : savedUrl;

      // 2. Safely parse the string into a Uri object
      final uri = Uri.tryParse(cleanUrl);

      if (uri != null) {
        // 3. Populate Schema
        if (uri.scheme == 'https') {
          _schema = 'https://';
        } else if (uri.scheme == 'http') {
          _schema = 'http://';
        }

        // 4. Populate Host (this ignores scheme and port!)
        _hostController.text = uri.host;

        // 5. Populate Port (if one was explicitly set)
        if (uri.hasPort) {
          _usePort = true;
          _portController.text = uri.port.toString();
        }
      } else {
        // Fallback: Just in case the saved string was horribly malformed
        String s = cleanUrl
            .replaceAll('https://', '')
            .replaceAll('http://', '');
        _hostController.text = s;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Localizations.override(
                context: context,
                locale: const Locale('en'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: const Text('Configure API Server')),
                    ),

                    SizedBox(
                      // width: 90,
                      child: DropdownButtonFormField<String>(
                        value: _schema,
                        decoration: const InputDecoration(labelText: 'Schema'),
                        items: const [
                          DropdownMenuItem(
                            value: 'http://',
                            child: Text('http://'),
                          ),
                          DropdownMenuItem(
                            value: 'https://',
                            child: Text('https://'),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _schema = val);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    // 2. Host / IP Field
                    CustomTextField(
                      controller: _hostController,
                      labelText: 'Host / IP',
                      keyboardType: TextInputType.url,
                      validator: (String? s) {
                        if (s == null || s.trim().isEmpty) {
                          return 'Please enter the host';
                        }
                        final input = s.trim();
                        if (input.startsWith('http')) {
                          return 'Remove http/https';
                        }
                        if (input.contains(':')) {
                          return 'Remove port (use checkbox)';
                        }
                        if (input.endsWith('/')) {
                          return 'Remove trailing slash';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // 3. Checkbox to toggle port
                    Row(
                      children: [
                        Checkbox(
                          value: _usePort,
                          onChanged: (val) {
                            setState(() {
                              _usePort = val ?? false;
                              // Clear the port if the user unchecks the box
                              if (!_usePort) _portController.clear();
                            });
                          },
                        ),
                        const Text('Specify Custom Port'),
                      ],
                    ),

                    // 4. Conditional Port Field
                    if (_usePort) ...[
                      const SizedBox(height: 8),
                      TextFormField(
                        // Used standard TextFormField to easily add inputFormatters
                        controller: _portController,
                        // labelText: 'Port',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'e.g. 8080',
                        ),
                        validator: (String? s) {
                          if (!_usePort) return null;
                          if (s == null || s.trim().isEmpty) {
                            return 'Please enter a port';
                          }
                          final port = int.tryParse(s.trim());
                          if (port == null || port <= 0 || port > 65535) {
                            return 'Invalid port (1-65535)';
                          }
                          return null;
                        },
                      ),
                    ],
                    TextButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      child: const Text('Cancel'),
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final host = _hostController.text.trim();

                              // 5. Safely construct the final URL
                              String finalUrl = '$_schema$host';

                              if (_usePort &&
                                  _portController.text.trim().isNotEmpty) {
                                finalUrl += ':${_portController.text.trim()}';
                              }

                              finalUrl += '/api';

                              await appStorage.setString(apiUrlKey, finalUrl);

                              if (!context.mounted) return;

                              ref.invalidate(serverHealthProvider);
                              context.mayPop();
                            }
                          },
                          child: const Text('Save'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
