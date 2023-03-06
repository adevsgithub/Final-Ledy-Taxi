part of 'app_settings_cubit.dart';

class AppSettingsState {
  final bool isLight;

  AppSettingsState({
    this.isLight = true,
  });

  AppSettingsState copyWith({
    bool? isLight,
  }) {
    return AppSettingsState(
      isLight: isLight ?? this.isLight,
    );
  }
}
