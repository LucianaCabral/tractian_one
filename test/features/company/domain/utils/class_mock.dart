import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge_one/features/dashboard/data/source/company_remote_dataSource.dart';
import 'package:tractian_challenge_one/features/dashboard/domain/repository/company_repository.dart';
import 'package:tractian_challenge_one/features/dashboard/domain/usecase/get_companies_use_case.dart';

class CompanyRepositoryMock extends Mock implements CompanyRepository {}
class GetCompaniesUseCaseMock extends Mock implements GetCompaniesUseCase {}
class CompanyRemoteDataSourceMock extends Mock implements CompanyRemoteDataSource {}
