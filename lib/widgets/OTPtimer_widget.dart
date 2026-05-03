import 'package:flutter/material.dart';
import 'dart:async';

class OtpTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;

  const OtpTimer({super.key, this.seconds = 60, required this.onResend});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late int seconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    seconds = widget.seconds;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return seconds > 0
        ? Text("ما وصلك الرمز؟ أعد الإرسال بعد ${formatTime(seconds)}")
        : TextButton(
          onPressed: () {
            setState(() {
              seconds = widget.seconds;
            });
            startTimer();
            widget.onResend();
          },
          child: const Text(
            "إعادة إرسال الرمز",
            style: TextStyle(color: Color(0xffF57C00)),
          ),
        );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
