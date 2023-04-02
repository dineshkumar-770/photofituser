import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationState> {
  NavigationBarCubit() : super(const NavigationState(navBarItems: NavBarItems.home,index: 0));

  void getNavBarItems(NavBarItems navBarItems) {
    switch (navBarItems) {
      case NavBarItems.settings:
        emit(const NavigationState(navBarItems: NavBarItems.settings, index: 3));
        break;
      case NavBarItems.cart:
        emit(const NavigationState(navBarItems: NavBarItems.cart, index: 1));
        break;
      case NavBarItems.profile:
        emit(const NavigationState(navBarItems: NavBarItems.profile, index: 2));
        break;
      case NavBarItems.home:
        emit(const NavigationState(navBarItems: NavBarItems.home, index: 0));
        break;
    }
  }
}
