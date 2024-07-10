import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/core_module.dart';
import 'features/dashboard/presentation/provider/company_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ModularApp(
      module: CoreModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Modular.get<CompanyProvider>(),
      child: MaterialApp.router(
        title: 'Company List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
