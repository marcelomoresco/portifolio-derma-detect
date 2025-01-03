import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/skin_care_section.dart';
import 'package:flutter/material.dart';

final List<SkinCareTip> skinCareTips = [
  SkinCareTip(
    title: "Use Protetor Solar",
    description: "Protetor solar é fundamental em todas ocasiões, mesmo estando em casa!",
    icon: Icons.wb_sunny,
  ),
  SkinCareTip(
    title: "Evite Exposição ao Sol nas Horas de Pico",
    description: "Tente evitar exposição direta ao sol entre 10h e 16h.",
    icon: Icons.watch_later,
  ),
  SkinCareTip(
    title: "Alimente-se Bem",
    description: "Inclua alimentos ricos em antioxidantes e vitaminas na sua dieta.",
    icon: Icons.restaurant,
  ),
  SkinCareTip(
    title: "Limpeza Diária",
    description: "Lave o rosto duas vezes ao dia para remover sujeira, óleo e outras impurezas.",
    icon: Icons.cleaning_services,
  ),
  SkinCareTip(
    title: "Durma Bem",
    description: "Ter uma boa noite de sono ajuda a regeneração celular.",
    icon: Icons.bedtime,
  ),
  SkinCareTip(
    title: "Não Exagere na Esfoliação",
    description: "Excesso de esfoliação pode remover a camada protetora natural da pele.",
    icon: Icons.spa,
  ),
];
