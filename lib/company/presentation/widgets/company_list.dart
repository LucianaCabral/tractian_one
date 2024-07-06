import 'package:flutter/material.dart';

import '../../domain/entities/company.dart';

class CompanyList extends StatelessWidget {
  final List<Company> companies;

  const CompanyList({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return Card(
          elevation: 4,
          color: Colors.blue,
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(Icons.business, color: Colors.white),
            title: Text(
              company.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
