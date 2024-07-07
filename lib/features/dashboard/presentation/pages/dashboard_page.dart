import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/company_provider.dart';
import '../resources/app_strings.dart';
import '../widgets/company_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle,
            style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Consumer<CompanyProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.errorMessage != null)
                Text('Error: ${provider.errorMessage}')
              else
                Expanded(child: CompanyList(companies: provider.companies)),
            ],
          );
        },
      ),
    );
  }
}
