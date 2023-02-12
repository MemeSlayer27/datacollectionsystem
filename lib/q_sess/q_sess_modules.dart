import 'q_sess_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderModule extends StatelessWidget {
  const SliderModule(
      {Key? key,
      required this.sliderValue,
      required this.valueDisplayText,
      required this.valueDisplayFontSize,
      required this.maxValue,
      required this.onConfirm,
      required this.onSliderChanged})
      : super(key: key);

  final double sliderValue;
  final String valueDisplayText;
  final double valueDisplayFontSize;
  final double maxValue;
  final Function() onConfirm;
  final Function(double value) onSliderChanged;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ValueDisplay(
                  textWidget: Text(
                    valueDisplayText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubikIso(
                      fontSize: valueDisplayFontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SliderConfirmationButton(
                  onTap: onConfirm,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: VerticalSlider(
            sliderValue: sliderValue,
            // 12 hours in fifteen minute increments plus 0
            maxValue: maxValue,
            onChanged: onSliderChanged,
          ),
        ),
      ],
    );
  }
}

class YesNoModule extends StatelessWidget {
  const YesNoModule({Key? key, required this.onYes, required this.onNo})
      : super(key: key);

  final Function() onYes;
  final Function() onNo;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: SizedBox()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              YesNoButton(
                onTap: onNo,
                text: "NO, Next",
                color: Color.fromARGB(255, 223, 134, 134),
                shadowColor: Colors.grey,
              ),
              YesNoButton(
                onTap: onYes,
                text: "YES, Next",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AnythingOfNote extends StatelessWidget {
  AnythingOfNote({
    Key? key,
    required this.onChanged,
    required this.onFinalize,
  }) : super(key: key);

  final Function(String str) onChanged;
  final Function() onFinalize;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: TextField(
          maxLines: 5,
          onChanged: onChanged,
        ),
      ),
      SessionFinalizationButton(onTap: onFinalize),
    ]);
  }
}
