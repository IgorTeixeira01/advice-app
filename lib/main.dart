import 'package:advice_app/injection_container.dart';
import 'package:advice_app/presentation/bloc/advice_slip_bloc.dart';
import 'package:advice_app/presentation/pages/advice_slip_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AdviceSlipBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: AdviceSlipPage(),
      ),
    );
  }
}
