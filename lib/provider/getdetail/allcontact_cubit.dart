import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'allcontact_state.dart';

class AllcontactCubit extends Cubit<AllcontactState> {
  AllcontactCubit() : super(AllcontactInitial());
}
