import 'package:financial_recording/dependency_injection.dart';
import 'package:financial_recording/features/financial/presentation/bloc/add_financial_bloc/add_financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/bloc/financial_count_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/get_data_bloc/financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FinancialBloc>(
          create: (context) =>
              FinancialBloc(sl(), sl(), sl(), sl())..add(GetDataEvent()),
        ),
        BlocProvider(
          create: (context) => AddFinancialBloc(sl(), sl(), sl()),
        ),
        BlocProvider(
          create: (context) => FinancialCountBloc(sl(), sl(), sl()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
