import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void changeDarkMode(bool value) {
    emit(state.copyWith(darkMode: value));
  }

  void changeFlashOn(bool value) {
    emit(state.copyWith(flashOn: value));
  }

  void changeWifiConnected(bool value) {
    emit(state.copyWith(wifiConnected: value));
  }

  void changeIsPortrait(bool value) {
    emit(state.copyWith(isPortrait: value));
  }

  void changeLocation(bool value) {
    emit(state.copyWith(location: value));
  }
}