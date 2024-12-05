import 'package:derma_detect/src/core/widgets/organisms/modal_organism.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class ModalPermissionOrganism extends StatelessWidget {
  const ModalPermissionOrganism({
    super.key,
    required this.title,
    required this.description,
    required this.onTapCloseModalPermission,
    this.isPopModalAllowed = true,
    this.onTapFirstButtonOnClick,
    this.icon,
  });

  final String title;
  final String description;
  final VoidCallback onTapCloseModalPermission;
  final bool isPopModalAllowed;
  final VoidCallback? onTapFirstButtonOnClick;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ModalOrganism(
      isPopModalAllowed: isPopModalAllowed,
      icon: FontAwesomeIcons.triangleExclamation,
      title: title,
      description: description,
      firstButtonTitle: "Abrir configurações",
      firstButtonOnClick: () async {
        onTapFirstButtonOnClick?.call();
        Navigator.of(context).pop();
        await openAppSettings();
      },
      firstButtonIsOutlined: true,
      secondButtonOnClick: () {
        Navigator.of(context).pop();
        onTapCloseModalPermission();
      },
      secondButtonTitle: "Fechar",
    );
  }
}
