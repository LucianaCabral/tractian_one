import 'package:flutter/material.dart';
import '../../domain/entities/company.dart';
import '../../domain/usecase/get_companies_use_case.dart';

class CompanyProvider with ChangeNotifier {
  final GetCompaniesUseCase getCompaniesUseCase;

  CompanyProvider(this.getCompaniesUseCase) {
    fetchCompanies();
  }

  List<Company> _companies = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Company> get companies => _companies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCompanies() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final companies = await getCompaniesUseCase.call();
      _companies = companies;
    } catch (e) {
      _errorMessage = e.toString();
          } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
