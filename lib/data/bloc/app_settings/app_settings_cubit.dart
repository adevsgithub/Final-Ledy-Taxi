import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState());

  void changeThema() {
    emit(state.copyWith(isLight: !state.isLight));
  }
}
