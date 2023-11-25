import 'package:flutter_bloc/flutter_bloc.dart';
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  /// update index function to update the index onTap in BottomNavigationBar
  void updateIndex(int index) => emit(index);

  /// for navigation button on single page
  void Home() => emit(0);
  void search() => emit(1);
  void Cart() => emit(2);
  void Profile() => emit(3);

}
