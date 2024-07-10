import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge_one/features/dashboard/data/repository/company_repository_impl.dart';
import 'package:tractian_challenge_one/features/dashboard/data/source/company_remote_dataSource.dart';

import '../../domain/utils/class_mock.dart';
import '../../stubs.dart';
void main() {
  group('CompanyRepositoryImpl', () {
    late CompanyRepositoryImpl companyRepository;
    late CompanyRemoteDataSource dataSource;

    final company = companyMock;

    setUp(() {
      dataSource = CompanyRemoteDataSourceMock();
      companyRepository = CompanyRepositoryImpl(companyRemoteDataSource: dataSource);
    });

    test('getPopularCompany should return a list of Company', () async {
      when(() => dataSource.getCompanies())
          .thenAnswer((_) async => Future.value(company));

      final result = await companyRepository.getCompanies();

      expect(result, company);
    });
 });
}
