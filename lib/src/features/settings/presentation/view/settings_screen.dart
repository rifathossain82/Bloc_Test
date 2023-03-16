import 'package:bloc_test/src/core/helpers/helper_methods.dart';
import 'package:bloc_test/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          kPrint('Settings Updated!');
        },
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile.adaptive(
                value: state.darkMode,
                onChanged: (value) {
                  context.read<SettingsCubit>().changeDarkMode(value);
                },
                title: const Text('Dark Mode'),
              ),
              SwitchListTile.adaptive(
                value: state.flashOn,
                onChanged: (value) {
                  context.read<SettingsCubit>().changeFlashOn(value);
                },
                title: const Text('Flash Light'),
              ),
              SwitchListTile.adaptive(
                value: state.wifiConnected,
                onChanged: (value) {
                  context.read<SettingsCubit>().changeWifiConnected(value);
                },
                title: const Text('Wifi'),
              ),
              SwitchListTile.adaptive(
                value: state.isPortrait,
                onChanged: (value) {
                  context.read<SettingsCubit>().changeIsPortrait(value);
                },
                title: const Text('Portrait'),
              ),
              SwitchListTile.adaptive(
                value: state.location,
                onChanged: (value) {
                  context.read<SettingsCubit>().changeLocation(value);
                },
                title: const Text('Location'),
              ),
            ],
          );
        },
      ),
    );
  }
}
