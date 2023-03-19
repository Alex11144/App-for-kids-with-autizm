import 'package:kids_app/ui/settings/settings_main.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

bool visible = true;
int animationIndex = 0;

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  // late var _controller;

  @override
  void initState() {
    super.initState();
//     _controller = AnimationController(vsync: this);
//     _controller.addListener(() {
//       print(_controller.value);
//       //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
//       if (_controller.value > 0.9) {
// // When it gets there hold it there.
//         _controller.value = 0.9;
//       }
//     });

    Future.delayed(const Duration(seconds: 6), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          visible =
              false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }

      // visible = true;
      // setState(() {});
    });
  }

// @override
//   void dispose() {
//     // _controller.noSuchMethod(invocation)
//     // TODO: implement dispose
//     super.dispose();
//   }
  String loadingString = 'Loading.....';
  // Duration delayInterval = const Duration(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    // final watch = context.watch<CardsProvider>();

    return isCongratulated
        ? Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: visible,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Lottie.network(
                animationIndex == 1
                    ? 'https://assets2.lottiefiles.com/private_files/lf30_CCLano.json'
                    : animationIndex == 2
                        ? 'https://assets2.lottiefiles.com/packages/lf20_1eewuim0.json'
                        : animationIndex == 3
                            ? 'https://assets2.lottiefiles.com/packages/lf20_l4xxtfd3.json'
                            : animationIndex == 4
                                ? 'https://assets2.lottiefiles.com/packages/lf20_eKiblrYxtC.json'
                                : 'https://assets2.lottiefiles.com/private_files/lf30_CCLano.json',
                //     controller: _controller,
                //     onLoaded: (comp) {

                //   // _controller
                //   //   ..duration = comp.duration
                //   //   ..forward();
                //   // Future.delayed(Duration(seconds: 3), () {
                //   //   // deleayed code here

                //   //   watch.showLottie = false;
                //   //   // setState(() {});
                //   // });
                //   // setState(() {});
                //   // Navigator.pop(context);
                // }
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
