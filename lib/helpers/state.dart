import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/app_state.dart';

abstract class StateUtils {
  /// retorna o estado principal
  static AppState appStateWithContext(BuildContext context) =>
      Provider.of<AppState>(context, listen: false);

  static AppState appStateWithListen(BuildContext context) =>
      Provider.of<AppState>(context);

}