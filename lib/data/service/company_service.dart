import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/company_model.dart';

part 'company_service.g.dart';

@RestApi(baseUrl: "https://fake-api.tractian.com")
abstract class CompanyService {
  factory CompanyService(Dio dio, {String baseUrl}) = _CompanyService;

  @GET("/companies")
  Future<List<CompanyModel>> getCompanies();
}
