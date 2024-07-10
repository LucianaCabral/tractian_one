import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_challenge_one/features/dashboard/di/dashboard_module.dart';

class CoreModule extends Module {

  @override
 void routes(r) {
    r.module('/', module: DashBoardModule());
  }
}