import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_challenge_one/features/dashboard/data/service/company_service.dart';
import 'package:tractian_challenge_one/features/dashboard/presentation/pages/dashboard_page.dart';

import '../data/mapper/company_mapper.dart';
import '../data/mapper/company_mapper_impl.dart';
import '../data/repository/company_repository_impl.dart';
import '../data/source/company_remote_dataSource.dart';
import '../data/source/company_remote_data_source_impl.dart';
import '../domain/repository/company_repository.dart';
import '../domain/usecase/get_companies_use_case.dart';
import '../presentation/provider/company_provider.dart';

class DashBoardModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(() => Dio());
    i.addSingleton<CompanyService>(() => CompanyService(i.get<Dio>()));
    i.addSingleton<CompanyMapper>(() => CompanyMapperImpl());
    i.addSingleton<CompanyRemoteDataSource>(() => CompanyRemoteDataSourceImpl(
      i.get<CompanyService>(), i.get<CompanyMapper>()));
    i.addSingleton<CompanyRepository>(() => CompanyRepositoryImpl(companyRemoteDataSource: i.get<CompanyRemoteDataSource>()));
    i.addSingleton<GetCompaniesUseCase>(() => GetCompaniesUseCase(i.get<CompanyRepository>(),
    ));
    i.addSingleton<CompanyProvider>(() => CompanyProvider(
      i.get<GetCompaniesUseCase>(),
    ));
  }
  @override
  void routes(r) {
     r.child('/', child: (context) => const DashboardPage());
  }
}