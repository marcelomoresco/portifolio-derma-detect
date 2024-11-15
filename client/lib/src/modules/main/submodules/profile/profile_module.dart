import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/datasource/profile_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/repository/profile_repository_impl.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/repository/profile_repository.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/usecases/delete_account_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/usecases/sign_out_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/cubits/profile_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/pages/profile_page.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/presentation/pages/about_page.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/pages/faq_list_categories_page.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/profile_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileSubmodule extends Module {
  static const moduleName = '/profile';
  static const routePath = MainModule.routePath + moduleName;

  @override
  void binds(i) {
    //Navigator
    i.addLazySingleton(() => ProfileNavigator());

    //Others
    i.addLazySingleton<ProfileRemoteDatasource>(
      () => ProfileRemoteDatasourceImpl(
        networkService: i(),
      ),
    );

    //Repositorys
    i.addLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(datasource: i()));

    //Usecases
    i.addLazySingleton(() => SignOutUsecase(repository: i()));
    i.addLazySingleton(() => DeleteAccountUsecase(repository: i()));

    i.addLazySingleton(
      () => ProfileCubit(
        sharedNavigator: i(),
        signOutUsecase: i(),
        deleteAccountUsecase: i(),
        profileNavigator: i(),
      ),
    );
  }

  static void profileRoutes(
    RouteManager r,
  ) {
    r.child(
      ProfilePage.routeName,
      child: (_) => const ProfilePage(),
    );
    r.child(
      AboutPage.routeName,
      child: (_) => const AboutPage(),
    );
    r.child(
      FaqListCategoriesPage.routeName,
      child: (_) => const FaqListCategoriesPage(),
    );
  }
}
