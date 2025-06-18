import 'package:flutter/material.dart';
import 'package:project_01/presentation/advicer/widgets/advice_field.dart';
import 'package:project_01/presentation/advicer/widgets/custom_button.dart';

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
                child:

                  AdviceField(advice: 'guter rat ist teuer, das ist mir ungeheuer, ich bin ein alter räuber',),

                /*Text(
                  "Your advice is waiting for you!",
                  style: themeData.textTheme.headlineMedium,textAlign: TextAlign.center,
                ),

                 */
              ),
            ),

            SizedBox(
              height: 200,
              child: Center(child: CustomButton(onPressed: () {})),
            ),
          ],
        ),
      ),
    );
  }
}
