import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String dateString = date.toString().split(" ")[0];
    String timeString = date.toString().split(" ")[1];

    String timeStringPruned = timeString.split(".")[0];

    return GestureDetector(
      onLongPressDown: (detail) {},
      onLongPress: () {
        //TODO: Should abort session. Give the option to submit intermediary answers
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Collection In Progress[DCIP]",
              style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700, fontSize: 17.0),
            ),
            Text(dateString),
            Text(timeStringPruned),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "LONG-PRESS TO ABORT",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(235, 255, 4, 4)),
            )
          ],
        ),
      ),
    );
  }
}

class SessionFinalizationButton extends StatelessWidget {
  const SessionFinalizationButton({Key? key, required this.onTap})
      : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        child: Ink(
          height: 100.0,
          width: 160.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 223, 134, 134),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Text(
              "Finalize Session",
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalSlider extends StatelessWidget {
  const VerticalSlider({
    Key? key,
    required this.onChanged,
    required this.sliderValue,
    required this.maxValue,
  }) : super(key: key);

  final Function(double value) onChanged;
  final double sliderValue;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        child: Theme(
          data: Theme.of(context).copyWith(
            sliderTheme: const SliderThemeData(
              trackHeight: 1,
              activeTrackColor: Color.fromARGB(255, 146, 146, 146),
              thumbColor: Color.fromARGB(255, 192, 94, 94),
            ),
          ),
          child: Slider(
            max: maxValue,
            divisions: maxValue.toInt(),
            value: sliderValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class YesNoButton extends StatelessWidget {
  const YesNoButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.shadowColor = const Color.fromARGB(255, 223, 134, 134),
    this.color = Colors.white,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color shadowColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        child: Ink(
          height: 100.0,
          width: 160.0,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ValueDisplay extends StatelessWidget {
  const ValueDisplay({Key? key, required this.textWidget}) : super(key: key);

  final Text textWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 223, 134, 134),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(5.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Center(
        child: textWidget,
      ),
    );
  }
}

class SliderConfirmationButton extends StatelessWidget {
  const SliderConfirmationButton({Key? key, required this.onTap})
      : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        child: Ink(
          height: 100.0,
          width: 160.0,
          child: Center(
            child: Text(
              "Confirm, Next",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 223, 134, 134),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
