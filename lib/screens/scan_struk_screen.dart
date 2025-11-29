import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScanStrukScreen extends StatelessWidget {
  const ScanStrukScreen({super.key});

  Future<void> _pickAndScan(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image == null) {
        return;
      }
      final inputImage = InputImage.fromFilePath(image.path);
      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );
      debugPrint('SCAN_STRUK: ${recognizedText.text}');
      await textRecognizer.close();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil scan. Lihat log untuk hasilnya.'),
          ),
        );
      }
    } catch (e) {
      debugPrint('SCAN_STRUK_ERROR: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal memproses gambar.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Struk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pindai struk belanja untuk mengekstrak item dan total otomatis.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (ctx) {
                    final colorScheme = Theme.of(ctx).colorScheme;
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.camera_alt,
                              color: colorScheme.primary,
                            ),
                            title: const Text('Kamera'),
                            onTap: () async {
                              Navigator.pop(ctx);
                              await _pickAndScan(context, ImageSource.camera);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.photo_library,
                              color: colorScheme.primary,
                            ),
                            title: const Text('Galeri'),
                            onTap: () async {
                              Navigator.pop(ctx);
                              await _pickAndScan(context, ImageSource.gallery);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.document_scanner),
              label: const Text('Mulai Pindai'),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
