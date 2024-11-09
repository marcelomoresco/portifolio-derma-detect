part of 'about_cubit.dart';

class AboutState extends Equatable {
  const AboutState({
    this.model = '',
    this.system = '',
    this.version = '',
    this.build = '',
    required this.status,
  });

  final String model;
  final String system;
  final String version;
  final String build;
  final Status status;

  @override
  List<Object?> get props => [
        model,
        system,
        version,
        build,
        status,
      ];

  AboutState copyWith({
    String? model,
    String? system,
    String? version,
    String? build,
    Status? status,
  }) {
    return AboutState(
      model: model ?? this.model,
      system: system ?? this.system,
      version: version ?? this.version,
      build: build ?? this.build,
      status: status ?? this.status,
    );
  }
}
