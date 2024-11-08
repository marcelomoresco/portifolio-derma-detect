import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/core/components/organisms/modal_organism.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/entities/menu_tile_entity.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/cubits/profile_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/templates/profile_template.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/profile_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const routeName = '/profile-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends DermaCubitState<ProfilePage, ProfileCubit> {
  @override
  void initState() {
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final directActionTileContent = ProfileTileInfoEntity(
      name: ProfileStrings.directActionTile.logOut,
      icon: Icons.logout,
      onPressed: _showMyCardModalSignOut,
    );

    final List<ProfileTileInfoEntity> menuListContent = [
      ProfileTileInfoEntity(
          name: ProfileStrings.menuTile.notificationsFieldName,
          description: ProfileStrings.menuTile.notificationsDescription,
          icon: Icons.notification_add,
          enabled: false,
          onPressed: () {}),
      ProfileTileInfoEntity(
        name: ProfileStrings.menuTile.helpMeFieldName,
        description: ProfileStrings.menuTile.helpMeDescription,
        icon: FontAwesomeIcons.circleQuestion,
        onPressed: cubit.openHelpMePage,
      ),
      ProfileTileInfoEntity(
        name: ProfileStrings.menuTile.closeAccountFieldName,
        description: ProfileStrings.menuTile.closeAccountDescription,
        icon: Icons.delete,
        onPressed: () {},
      ),
      ProfileTileInfoEntity(
        name: ProfileStrings.menuTile.aboutFieldName,
        description: ProfileStrings.menuTile.aboutDescription,
        icon: FontAwesomeIcons.info,
        onPressed: cubit.openAboutPage,
      ),
    ];

    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: ProfileTemplate(
            menuListContent: menuListContent,
            directActionTileContent: directActionTileContent,
          ),
        );
      },
    );
  }

  Future<void> _showMyCardModalSignOut() async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: cubit,
          builder: (context, state) {
            return ModalOrganism(
              firstButtonOnClick: cubit.signOut,
              firstButtonTitle: ProfileStrings.modalSignOut.firstButtonTitle,
              secondButtonOnClick: Navigator.of(context).pop,
              secondButtonTitle: ProfileStrings.modalSignOut.secondButtonTitle,
              description: ProfileStrings.modalSignOut.description,
              icon: Icons.logout,
              firstButtonIsLoading: state.signOutStatus == Status.loading,
              title: ProfileStrings.modalSignOut.title,
              isEnabledSecondButton: !state.signOutStatus.isLoading,
            );
          },
        ),
      ),
    );
  }
}
