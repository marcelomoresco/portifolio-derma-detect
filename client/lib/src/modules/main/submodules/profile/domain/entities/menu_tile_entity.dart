import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileTileInfoEntity extends Equatable {
  const ProfileTileInfoEntity({
    required this.name,
    required this.icon,
    required this.onPressed,
    this.description,
    this.enabled = true,
  });
  final String name;
  final String? description;
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  List<Object?> get props => [
        name,
        description,
        icon,
        onPressed,
        enabled,
      ];
}
