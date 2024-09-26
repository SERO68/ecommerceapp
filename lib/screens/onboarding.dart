import 'package:ecommerceapp/classes/onboardbuilder.dart';
import 'package:ecommerceapp/classes/onboardingmodel.dart';
import 'package:ecommerceapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: page,
          itemCount: onboardingData.length,
          onPageChanged: (value) {
            Model model = Provider.of<Model>(context, listen: false);
            setState(() {
              if (value == 2) model.setislast(true);
            });
          },
          itemBuilder: (context, index) {
            return Onboardbuilder(
              onboardingData[index],
              page: page,
            );
          },
        ),
      ),
    );
  }
}
