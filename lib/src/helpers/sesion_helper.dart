import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void signOut(BuildContext context) async {
  PreferencesRepository _preferencesRepository =
      RepositoryProvider.of<PreferencesRepository>(context);

  _preferencesRepository.save<bool>('isLogged', false);
  await _preferencesRepository.remove('token');
  await _preferencesRepository.remove('initial_route');

  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
}
