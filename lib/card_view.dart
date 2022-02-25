import 'package:abdulelah_flutter_festival/card_info.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final CardInfo card;
  const CardView({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'صانع البطاقات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(25),
              elevation: 15,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image(
                          height: 120,
                          image: AssetImage('assets/${card.imageNum}.png'))),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'دعوة حضور',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Text(
                          'عزيز/ ${card.reciverName} \n سأسعد برؤيتك يوم ${dateToString(card.date)}, \nفي مدينة ${card.city}\n\nمع تحياتي,\nداش',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dateToString(DateTime d) {
    int m = d.month;
    String s = '';
    switch (m) {
      case 1:
        s = d.day.toString() + ' يناير';
        break;
      case 2:
        s = d.day.toString() + ' فبراير';
        break;
      case 3:
        s = d.day.toString() + ' مارس';
        break;
      case 4:
        s = d.day.toString() + ' ابريل';
        break;
      case 5:
        s = d.day.toString() + ' مايو';
        break;
      case 6:
        s = d.day.toString() + ' يونيو';
        break;
      case 7:
        s = d.day.toString() + ' يوليو';
        break;
      case 8:
        s = d.day.toString() + ' اغسطس';
        break;
      case 9:
        s = d.day.toString() + ' سبتمبر';
        break;
      case 10:
        s = d.day.toString() + ' اكتوبر';
        break;
      case 11:
        s = d.day.toString() + ' نوفمبر';
        break;
      case 12:
        s = d.day.toString() + ' ديسمبر';
        break;
    }
    return s;
  }
}
