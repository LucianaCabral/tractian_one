import '../../domain/entities/company.dart';
import '../model/company_model.dart';
import 'company_mapper.dart';

class CompanyMapperImpl extends CompanyMapper {
  @override
  Company toEntity(CompanyModel companyModel) {
    return Company(
        id: companyModel.id,
        name: companyModel.name,
        parentId: companyModel.parentId);
  }
}
