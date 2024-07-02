import '../../domain/entities/company.dart';
import '../model/company_model.dart';

abstract class CompanyMapper {
  Company toEntity(CompanyModel companyModel);
}
