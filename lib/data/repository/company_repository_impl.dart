import '../../domain/entities/company.dart';
import '../../domain/repository/company_repository.dart';
import '../source/company_remote_dataSource.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyRemoteDataSource companyRemoteDataSource;

  CompanyRepositoryImpl({
    required this.companyRemoteDataSource,
  });

  @override
  Future<List<Company>> getCompanies() =>
      companyRemoteDataSource.getCompanies();
}
