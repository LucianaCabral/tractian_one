import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge_one/di/injection.dart';
import 'package:tractian_challenge_one/presentation/pages/company_list_page.dart';
import 'package:tractian_challenge_one/presentation/provider/company_provider.dart';

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
        home: const CompanyListPage(),
      ),
    );
  }
}
