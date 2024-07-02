import '../entities/company.dart';
import '../repository/company_repository.dart';

class GetCompaniesUseCase {
  final CompanyRepository repository;

  GetCompaniesUseCase(this.repository);

  Future<List<Company>> call() async {
    return await repository.getCompanies();
  }
}