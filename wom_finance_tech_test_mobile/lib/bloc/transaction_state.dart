part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final Transaction transaction;

  const TransactionLoaded(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class ListTransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  const ListTransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionLoadedFailed extends TransactionState {
  final String message;

  const TransactionLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
