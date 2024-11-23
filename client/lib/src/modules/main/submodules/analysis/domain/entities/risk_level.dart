enum RiskLevel {
  veryHigh('Muito Alto'),
  high('Alto'),
  medium('Médio'),
  low('Baixo');

  const RiskLevel(this.name);
  final String name;
}
