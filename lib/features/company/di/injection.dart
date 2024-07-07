import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../data/mapper/company_mapper.dart';
import '../data/mapper/company_mapper_impl.dart';
import '../data/repository/company_repository_impl.dart';
import '../data/service/company_service.dart';
import '../data/source/company_remote_dataSource.dart';
import '../data/source/company_remote_data_source_impl.dart';
import '../domain/repository/company_repository.dart';
import '../domain/usecase/get_companies_use_case.dart';
import '../presentation/provider/company_provider.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerFactory<CompanyService>(() => CompanyService(getIt<Dio>()));
  getIt.registerFactory<CompanyMapper>(() => CompanyMapperImpl());
  getIt.registerFactory<CompanyRemoteDataSource>(() => CompanyRemoteDataSourceImpl(getIt<CompanyService>(),getIt<CompanyMapper>()));
  getIt.registerFactory<CompanyRepository>(() => CompanyRepositoryImpl(companyRemoteDataSource: getIt<CompanyRemoteDataSource>()));
  getIt.registerFactory<GetCompaniesUseCase>(() => GetCompaniesUseCase(getIt<CompanyRepository>()));
  getIt.registerFactory<CompanyProvider>(() => CompanyProvider(getIt<GetCompaniesUseCase>())) ;
}

