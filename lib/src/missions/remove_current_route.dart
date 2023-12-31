import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/state_types.dart';

import '../state/sections/navigation_state.dart';

class RemoveCurrentRoute<S extends AstroState> extends LandingMission<S> {
  RemoveCurrentRoute();

  @override
  S landingInstructions(S state) {
    DefaultNavigationState navigation =
        (state as dynamic).navigation as DefaultNavigationState;
    var newNavigation =
        navigation.copyWith(stack: [...navigation.stack]..removeAt(0));
    return (state as dynamic).copyWith(navigation: newNavigation) as S;
  }

  @override
  toJson() => {'name_': 'RemoveCurrentRoute', 'state_': <String, dynamic>{}};
}
