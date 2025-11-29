import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            child: ListTile(
              leading: Icon(Icons.document_scanner, color: colorScheme.primary),
              title: const Text('Scan Struk Belanjaan'),
              subtitle: const Text(
                'Pindai struk untuk mencatat belanja secara otomatis.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/scan-struk'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
            color: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            child: ListTile(
              leading: Icon(
                Icons.pie_chart_rounded,
                color: colorScheme.primary,
              ),
              title: const Text('Laporan Pengeluaran'),
              subtitle: const Text(
                'Lihat ringkasan pengeluaran dengan grafik dan detail.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/laporan-pengeluaran'),
            ),
          ),
        ],
      ),
    );
  }
}
