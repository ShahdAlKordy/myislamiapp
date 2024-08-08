import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> phrases = ["سبحان الله", "الحمد لله", "الله أكبر"];
  String currentPhrase = "لا اله الا الله";

  void incrementCount() {
    setState(() {
      count++;
      if (count == 30) {
        count = 0;
        switch (currentPhrase) {
          case "سبحان الله":
            currentPhrase = "الحمد لله";
            break;
          case "الحمد لله":
            currentPhrase = "الله أكبر";
            break;
          case "الله أكبر":
            currentPhrase = "لا اله الا الله";
            break;
          default:
            currentPhrase = "سبحان الله";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Image.asset('assets/images/sebha_screen.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "عدد التسبيحات",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            value: count / 30,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffB7935F)),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          count.toString(),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: incrementCount,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffB7935F),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              textStyle: const TextStyle(
                fontSize: 20,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              currentPhrase,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
