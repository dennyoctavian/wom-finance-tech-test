import 'package:bloc/bloc.dart';
import 'package:wom_finance_tech_test_mobile/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:wom_finance_tech_test_mobile/services/services.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is FetchProducts) {
        ApiReturnValue<List<Product>> result =
            await ProductServices.getProducts();
        if (result.message == null) {
          emit(ProductLoaded(result.value!));
        } else {
          emit(ProductLoadedFailed(result.message.toString()));
        }
      }
    });
  }
}
