import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge_one/domain/repository/company_repository.dart';
import 'package:tractian_challenge_one/domain/usecase/get_companies_use_case.dart';

import '../utils/class_mock.dart';
import '../utils/stubs.dart';

void main() {
  late CompanyRepository companyRepository;
  late GetCompaniesUseCase getCompaniesUseCase;

  final company = companyMock;

  setUpAll(() {
    companyRepository = CompanyRepositoryMock();
    getCompaniesUseCase = GetCompaniesUseCase(companyRepository);
  });
  group("GetCompaniesUseCase: ", () {
    test('Should return a list of Company', () async {
      when(() => companyRepository.getCompanies()).thenAnswer((_) => Future.value(company));

      final result = await getCompaniesUseCase.call();

      expect(result, company);
    });
  });
}