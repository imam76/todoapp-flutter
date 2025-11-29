import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScanStrukScreen extends StatelessWidget {
  const ScanStrukScreen({super.key});

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
              onPressed: () {},
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
