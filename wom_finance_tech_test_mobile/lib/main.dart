import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wom_finance_tech_test_mobile/bloc/blocs.dart';
import 'package:wom_finance_tech_test_mobile/ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc()..add(FetchProducts())),
        BlocProvider(create: (_) => UserBloc()..add(FetchUser())),
        BlocProvider(
            create: (_) => TransactionBloc()..add(GetAllTransactionUser())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return const HomePage();
              } else if (state is UserLoadedFailed) {
                return const LoginPage();
              }
              return const Center(
                child: SpinKitFadingCircle(
                  size: 45,
                  color: Colors.yellow,
                ),
              );
            },
          )),
    );
  }
}
