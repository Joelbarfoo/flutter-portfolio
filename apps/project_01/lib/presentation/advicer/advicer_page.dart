import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_01/application/bloc/advicer_bloc.dart';
import 'package:project_01/presentation/advicer/widgets/advice_field.dart';
import 'package:project_01/presentation/advicer/widgets/custom_button.dart';
import 'package:project_01/presentation/advicer/widgets/error_message.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Advicer", style: themeData.textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  bloc: BlocProvider.of<AdvicerBloc>(context),
                  builder: (context, adviceState) {
                    if (adviceState is AdvicerInitial) {
                      return Text(
                        "Your advice is waiting for you!",
                        style: themeData.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      );
                    } else if (adviceState is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (adviceState is AdvicerStateLoaded) {
                      return AdviceField(advice: adviceState.advice);
                    } else if (adviceState is AdvicerStateError) {
                      return ErrorMessage();
                    } else {
                      return Placeholder();
                    }
                  },
                ),
              ),
            ),

            SizedBox(height: 200, child: Center(child: CustomButton())),
          ],
        ),
      ),
    );
  }
}
