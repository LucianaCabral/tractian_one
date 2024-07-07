import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/di/injection.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/dashboard/presentation/provider/company_provider.dart';

void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<CompanyProvider>()),
      ],
      child: MaterialApp(
        title: 'Company List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
