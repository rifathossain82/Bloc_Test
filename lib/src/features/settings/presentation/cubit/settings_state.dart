part of 'settings_cubit.dart';

class SettingsState {
  final bool darkMode;
  final bool flashOn;
  final bool wifiConnected;
  final bool isPortrait;
  final bool location;

  const SettingsState({
    this.darkMode = false,
    this.flashOn = false,
    this.wifiConnected = false,
    this.isPortrait = false,
    this.location = false,
  });

  SettingsState copyWith({
    bool? darkMode,
    bool? flashOn,
    bool? wifiConnected,
    bool? isPortrait,
    bool? location,
  }) {
    return SettingsState(
      darkMode: darkMode ?? this.darkMode,
      flashOn: flashOn ?? this.flashOn,
      wifiConnected: wifiConnected ?? this.wifiConnected,
      isPortrait: isPortrait ?? this.isPortrait,
      location: location ?? this.location,
    );
  }
}