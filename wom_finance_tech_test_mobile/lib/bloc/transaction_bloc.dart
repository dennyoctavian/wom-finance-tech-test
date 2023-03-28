import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wom_finance_tech_test_mobile/models/models.dart';
import 'package:wom_finance_tech_test_mobile/services/services.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is GetAllTransactionUser) {
        try {
          final response = await TransactionServices.getTransaction();
          if (response.value != null) {
            emit(ListTransactionLoaded(response.value!));
          } else {
            emit(TransactionLoadedFailed(response.message ?? ''));
          }
        } catch (e) {
          emit(TransactionLoadedFailed(e.toString()));
        }
      }

      if (event is MakeTransaction) {
        try {
          final response = await TransactionServices.makeTransaction(
              event.transactionRequest);
          if (response.value != null) {
            emit(TransactionLoaded(response.value!));
          } else {
            emit(TransactionLoadedFailed(response.message ?? ''));
          }
        } catch (e) {
          emit(TransactionLoadedFailed(e.toString()));
        }
      }
    });
  }
}
