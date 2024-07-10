import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../provider/company_provider.dart';
import '../resources/app_strings.dart';
import '../widgets/company_list.dart';

class DashboardPage extends StatelessWidget {

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Modular.get<CompanyProvider>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.appTitle,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Consumer<CompanyProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.errorMessage != null) {
              return Center(child: Text('Error: ${provider.errorMessage}'));
            } else {
              return Expanded(child: CompanyList(companies: provider.companies));
            }
          },
        ),
      ),
    );
  }
}
