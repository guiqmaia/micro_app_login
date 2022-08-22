import 'package:micro_app_login/app/pages/login_page.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

class LoginPageResolver implements MicroApp {
  @override
  String get microAppName => '/micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': ((context, args) => LoginPage()),
    };
  }
}
