library navigation_for_perception;

import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/navigation_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:flutter/material.dart';

export 'src/missions/push_route.dart';
export 'src/missions/remove_current_route.dart';
export 'src/state/sections/navigation_state.dart';
export 'src/transitions/basic_tween_slide_transition.dart';
export 'src/widgets/pages_navigator.dart';

/// Holds a map of {type : generator function}
/// The generator functions take a page state and return a page.
/// A [PageGenerator] is used with a [Locator] to allow the [AstroBase]
/// widget to turn [AppState.navigator.stack] into a [List<MaterialPage>] to
/// pass into the navigator.
class DefaultPageGenerator implements PageGenerator {
  DefaultPageGenerator();

  final Map<Type, MaterialPage<dynamic> Function(PageState)> _map = {};

  @override
  void add({
    required Type type,
    required MaterialPage<dynamic> Function(PageState) generator,
  }) =>
      _map[type] = generator;

  @override
  MaterialPage<dynamic> applyTo(PageState state) =>
      _map[state.runtimeType]!(state);
}

void initializeNavigationPlugin<S extends AstroState>() {}
