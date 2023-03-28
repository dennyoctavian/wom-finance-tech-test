import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wom_finance_tech_test_mobile/models/models.dart';
import 'package:wom_finance_tech_test_mobile/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is RegisterUser) {
        try {
          UserServices.register(event.name, event.email, event.password,
              event.confirmPassword, event.pictureUrl);

          final response = await UserServices.getUser();
          if (response.message != null) {
            emit(UserLoaded(response.value!));
          } else {
            emit(UserLoadedFailed(response.message ?? ''));
          }
        } catch (e) {
          emit(UserLoadedFailed(e.toString()));
        }
      }

      if (event is LoginUser) {
        try {
          UserServices.login(
            event.email,
            event.password,
          );
          final response = await UserServices.getUser();
          if (response.value != null) {
            emit(UserLoaded(response.value!));
          }
          emit(UserLoadedFailed(response.message ?? ''));
        } catch (e) {
          emit(UserLoadedFailed(e.toString()));
        }
      }

      if (event is FetchUser) {
        try {
          final response = await UserServices.getUser();
          if (response.value != null) {
            emit(UserLoaded(response.value!));
          } else {
            emit(UserLoadedFailed(response.message ?? ''));
          }
        } catch (e) {
          emit(UserLoadedFailed(e.toString()));
        }
      }

      if (event is LogoutUser) {
        await UserServices.logout();
        emit(AuthSuccessLogout());
      }
    });
  }
}
