import '../entities/company.dart';
import '../repository/company_repository.dart';

class GetCompanies {
  final CompanyRepository repository;

  GetCompanies(this.repository);

  Future<List<Company>> call() async {
    return await repository.getCompanies();
  }
}