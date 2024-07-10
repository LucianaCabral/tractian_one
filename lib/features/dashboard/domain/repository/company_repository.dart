import '../entities/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();
}