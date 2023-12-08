import 'package:advice_app/presentation/bloc/advice_slip_bloc.dart';
import 'package:advice_app/presentation/bloc/advice_slip_event.dart';
import 'package:advice_app/presentation/bloc/advice_slip_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceSlipPage extends StatefulWidget {
  const AdviceSlipPage({Key? key}) : super(key: key);

  @override
  State<AdviceSlipPage> createState() => _AdviceSlipPageState();
}

class _AdviceSlipPageState extends State<AdviceSlipPage> {
  TextEditingController idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'ADVICE SLIP',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextField(
                controller: idController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText:
                      'Insira um número de 1 a 100 para obter um conselho',
                  fillColor: const Color(0xffF3F3F3),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<AdviceSlipBloc>()
                      .add(OnAdviceChanged(int.parse(idController.text)));
                },
                child: const Text('Validar')),
            const SizedBox(height: 32.0),
            BlocBuilder<AdviceSlipBloc, AdviceSlipState>(
              builder: (context, state) {
                if (state is AdviceSlipLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AdviceSlipLoaded) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.result.id.toString(),
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            state.result.advice,
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24.0),
                    ],
                  );
                }
                if (state is AdviceSlipLoadedFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
