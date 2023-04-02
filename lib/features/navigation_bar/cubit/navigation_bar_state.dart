part of 'navigation_bar_cubit.dart';

enum NavBarItems { home, cart, settings, profile }

class NavigationState extends Equatable {
  final NavBarItems navBarItems;
  final int index;

  const NavigationState({required this.navBarItems, required this.index});

  @override
  List<Object> get props => [navBarItems,index];
}
