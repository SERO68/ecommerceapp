import 'package:ecommerceapp/enums.dart';
import 'package:ecommerceapp/screens/login.dart';
import 'package:ecommerceapp/classes/onboardingmodel.dart';
import 'package:ecommerceapp/shared.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceapp/provider.dart';

class Onboardbuilder extends StatefulWidget {
  final Onboardingmodel onboardingmodel;
  final PageController page;

  const Onboardbuilder(this.onboardingmodel, {super.key, required this.page});

  @override
  State<Onboardbuilder> createState() => _OnboardbuilderState();
}

class _OnboardbuilderState extends State<Onboardbuilder> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.onboardingmodel.image), fit: BoxFit.cover)),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.onboardingmodel.title,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.onboardingmodel.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 202, 202, 202)),
          ),
          const Spacer(),
          
          Consumer<Model>(
            builder: (context, model, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 20),
                    child: SmoothPageIndicator(
                      controller: widget.page,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.red,
                          dotColor: Colors.white),
                    ),
                  ),
                  
                  model.islast
                      ? Padding(
                        padding:  const EdgeInsets.only(
                              right: 20.0, bottom: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              shared.setBool(key: Sharedkeys.hasseen, value: true);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                            },
                            child: const Text('Get Started',style: TextStyle(color: Colors.white),),
                          ),
                      )
                      : Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, bottom: 20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                widget.page.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
