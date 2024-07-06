import '../../domain/entities/company.dart';

abstract class CompanyRemoteDataSource {
  Future<List<Company>> getCompanies();
}
