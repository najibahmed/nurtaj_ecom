import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../common/const/constants.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key,});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {

  late CountdownTimerController controller;
  // int endTime = DateTime.now().millisecondsSinceEpoch + 12 * 3600000;
  // DateTime endtime= DateTime.now().add(const Duration(hours: 3));
  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTimeDuration, onEnd: onEnd,);
    super.initState();
  }
@override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountdownTimer(
        // controller: controller,
        endTime: endTimeDuration,
        widgetBuilder: (_, time) {
          if (time == null) {
            return const Text('Timer over');
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  color: Colors.black.withOpacity(.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' ${time.hours??'00'} ',style: TextStyle(
                          color: Colors.white
                      ),) ,
                      Text(
                        ' Hours ',style: TextStyle(
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 45,
                  width: 45,
                  color: Colors.black.withOpacity(.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' ${time.min??'00'} ',style: TextStyle(
                          color: Colors.white
                      ),) ,
                      Text(
                        ' Min ',style: TextStyle(
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 45,
                  width: 45,
                  color: Colors.black.withOpacity(.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' ${time.sec??'00'} ',style: TextStyle(
                          color: Colors.white
                      ),) ,
                      Text(
                        ' Sec ',style: TextStyle(
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
