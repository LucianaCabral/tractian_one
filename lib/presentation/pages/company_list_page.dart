import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge_one/presentation/resources/app_strings.dart';
import '../provider/company_provider.dart';
import '../widgets/company_list.dart';

class CompanyListPage extends StatelessWidget {
  const CompanyListPage({super.key});

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
