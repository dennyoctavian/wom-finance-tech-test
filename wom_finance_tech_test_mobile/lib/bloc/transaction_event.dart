part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class GetAllTransactionUser extends TransactionEvent {}

class MakeTransaction extends TransactionEvent {
  final List<Product> transactionRequest;

  const MakeTransaction(this.transactionRequest);

  @override
  List<Object> get props => [transactionRequest];
}
