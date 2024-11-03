import 'package:design_system/design_system.dart';
import 'package:design_system/src/molecules/appbar/back_button_atom.dart';
import 'package:flutter/material.dart';

class SimpleAppBarMolecule extends StatefulWidget implements PreferredSizeWidget {
  const SimpleAppBarMolecule({
    super.key,
    this.onBackButtonTap,
    this.showBackButton = true,
    this.shouldShowBackButtonLabel = true,
    this.onCloseButtonTap,
    this.backgroundColor,
    this.centerTitle = true,
    this.title,
    this.canAutoPop = true,
    this.color = Colors.white,
    this.isLoading = false,
    this.backButtonColor,
    this.height,
    this.shapeBorder,
    this.elevation,
    this.actions,
    this.bottom,
    this.leading,
  });

  final VoidCallback? onBackButtonTap;
  final bool showBackButton;
  final bool shouldShowBackButtonLabel;
  final VoidCallback? onCloseButtonTap;
  final Color? backgroundColor;
  final bool centerTitle;
  final Widget? title;
  final bool canAutoPop;
  final Color color;
  final bool isLoading;
  final Color? backButtonColor;
  final double? height;
  final ShapeBorder? shapeBorder;
  final double? elevation;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? leading;

  @override
  State<SimpleAppBarMolecule> createState() => _SimpleAppBarMoleculeState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? (kToolbarHeight - 8));
}

class _SimpleAppBarMoleculeState extends State<SimpleAppBarMolecule> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor ?? context.colors.neutralWhite,
      elevation: widget.elevation,
      automaticallyImplyLeading: widget.showBackButton,
      centerTitle: widget.centerTitle,
      title: widget.title,
      leadingWidth: _leadingWidth,
      leading: widget.showBackButton
          ? BackArrowButtonAtom(
              isLoading: widget.isLoading,
              hasLabel: widget.shouldShowBackButtonLabel,
              onTap: () {
                widget.onBackButtonTap?.call();
                if (widget.canAutoPop) Navigator.maybePop(context);
              },
              color: widget.backButtonColor ?? context.colors.background!,
            )
          : widget.leading,
      actions: widget.actions ??
          (widget.onCloseButtonTap != null
              ? [
                  AbsorbPointer(
                    absorbing: widget.isLoading,
                    child: IconButton(
                      padding: const EdgeInsets.only(right: 16),
                      onPressed: widget.onCloseButtonTap,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]
              : null),
      bottom: widget.bottom,
      shape: widget.shapeBorder,
    );
  }

  double? get _leadingWidth => widget.showBackButton && widget.shouldShowBackButtonLabel ? 110 : null;
}
