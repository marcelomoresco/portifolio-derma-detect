import 'package:derma_detect/src/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/cubits/about_cubit.dart';
import 'presentation/pages/about_page.dart';

class AboutModule extends Module {
  static const moduleName = '/about-module';
  static const routePath = AppModule.routePath + moduleName;

  @override
  void binds(i) {
    // Cubits
    i.addLazySingleton(
      () => AboutCubit(
        deviceInfoService: i(),
      ),
    );
  }

  @override
  void routes(r) {
    r.redirect(
      AboutModule.routePath,
      to: AboutPage.routePath,
    );
    r.child(
      AboutPage.routeName,
      child: (_) => const AboutPage(),
    );
  }
}
