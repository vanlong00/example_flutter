import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  void search(String query) => emit(query);

  void clear() {
    if (state.isNotEmpty) emit('');
  }
}
