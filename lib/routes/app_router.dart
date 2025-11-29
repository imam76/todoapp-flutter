import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/details_screen.dart';
import '../screens/scan_struk_screen.dart';
import '../screens/laporan_pengeluaran_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'scan-struk',
          builder: (BuildContext context, GoRouterState state) {
            return const ScanStrukScreen();
          },
        ),
        GoRoute(
          path: 'laporan-pengeluaran',
          builder: (BuildContext context, GoRouterState state) {
            return const LaporanPengeluaranScreen();
          },
        ),
      ],
    ),
  ],
);
