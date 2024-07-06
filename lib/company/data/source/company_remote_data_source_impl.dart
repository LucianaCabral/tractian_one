import '../../domain/entities/company.dart';
import '../mapper/company_mapper.dart';
import '../service/company_service.dart';
import 'company_remote_dataSource.dart';

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  final CompanyService remoteService;
  final  CompanyMapper companyMapper;

  CompanyRemoteDataSourceImpl(this.remoteService, this.companyMapper);

  @override
  Future<List<Company>> getCompanies() async {
    final companies = await remoteService.getCompanies();
    return companies.map(companyMapper.toEntity).toList();
  }
}
