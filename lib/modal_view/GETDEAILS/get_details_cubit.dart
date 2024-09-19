import 'package:aiims_telephone_directory/modal_view/helpline_number_cubit/hepline_number_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../helper/dio_error_helper.dart';
import 'get_details_repo.dart';

part 'get_details_state.dart';

class GetDetailsCubit extends Cubit<GetDetailsState> {
  GetDetailsCubit() : super(GetDetailsInitial());

  void getDetails() async {
    emit(GetDetailsLoading());
    try {
      final response = await GetDetailsRepo.GetDetail();

      if (response.statusCode == 200) {
        // UserModal cadreModal = UserModal.fromJson(response.data);

        emit(GetDetailsLoaded());
      } else {
        emit(GetDetailsError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(GetDetailsError(error: handleDioError(e)));
    } catch (e) {
      emit(GetDetailsError(error: 'Something Went Wrong'));
    }
  }
}
