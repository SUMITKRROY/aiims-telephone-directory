part of 'get_details_cubit.dart';

@immutable
sealed class GetDetailsState {}

final class GetDetailsInitial extends GetDetailsState {}

final class GetDetailsLoading extends GetDetailsState {}

final class GetDetailsLoaded extends GetDetailsState {}

final class GetDetailsError extends GetDetailsState {
  final String error;
  GetDetailsError({required this.error});
}
