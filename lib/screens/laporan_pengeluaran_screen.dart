import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LaporanPengeluaranScreen extends StatelessWidget {
  const LaporanPengeluaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laporan Pengeluaran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lihat ringkasan pengeluaran harian, mingguan, dan bulanan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                height: 180,
                child: Center(
                  child: Text(
                    'Grafik akan tampil di sini',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
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
