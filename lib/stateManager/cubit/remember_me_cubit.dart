import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'remember_me_state.dart';

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(RememberMeInitial());
  void check() => emit(RememberMeChecked());
  void uncheck() => emit(RememberMeUnchecked());
}
