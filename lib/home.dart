// ignore_for_file: prefer_const_constructors

import 'package:abdulelah_flutter_festival/card_info.dart';
import 'package:abdulelah_flutter_festival/card_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int screenIndex = 0;
  List<CardInfo> cards = [];
  final _formKey = GlobalKey<FormState>();

  // for the new card
  String name = '', city = '', num = '1';
  DateTime date = DateTime.now();
  TextEditingController _nameFiled = new TextEditingController();
  TextEditingController _locationFiled = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return page(context);
  }

  void resetItems() {
    setState(() {
      name = city = '';
      num = '1';
      date = DateTime.now();
      _nameFiled.clear();
      _locationFiled.clear();
    });
  }

  Widget page(BuildContext context) {
    // mainPage
    if (screenIndex == 0) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      screenIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 40,
                  )),
              SizedBox(
                width: 20,
              ),
            ],
            toolbarHeight: 70,
            title: Text(
              'صانع البطاقات',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          body: Stack(children: [
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Image(
                  image: AssetImage('assets/2.png'),
                  color: Colors.blue.shade50,
                )),
            ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardView(card: cards[index])));
                      },
                      leading: IconButton(
                        onPressed: () async {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AlertDialog(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      content: Text(
                                          'هل انت متأكد من انك تريد حذف هذه الدعوة؟'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('لا')),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                cards.removeAt(index);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text('نعم')),
                                      ],
                                    ),
                                  ));
                        },
                        icon: Icon(
                          Icons.delete_sweep_outlined,
                          size: 30,
                        ),
                      ),
                      horizontalTitleGap: 6,
                      tileColor: index.isOdd
                          ? Colors.blue.shade100
                          : Colors.blue.shade200,
                      title: Text(
                        cards[index].reciverName,
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      subtitle: Text(
                        cards[index].city +
                            ' ${dateToString(cards[index].date)}',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      trailing: Image(
                        image:
                            AssetImage('assets/${cards[index].imageNum}.png'),
                      ),
                    )),
          ]),
        ),
      );
    }
    //
    //
    else if (screenIndex == 1) {
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
          body: Stack(children: [
            Positioned(
                right: 0,
                left: 0,
                top: 50,
                child: Image(
                  image: AssetImage('assets/$num.png'),
                  color: Colors.blue.shade50,
                )),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors
                                                              .blueAccent),
                                                  onPressed: () {
                                                    num = '1';
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/1.png'),
                                                  )),
                                            ),
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    num = '2';
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/2.png'),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    num = '3';
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/3.png'),
                                                  )),
                                            ),
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors
                                                              .blueAccent),
                                                  onPressed: () async {
                                                    num = '4';
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/4.png'),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));

                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 50,
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/$num.png'),
                          ),
                        )),
                    SizedBox(
                      height: 0,
                    ),
                    TextFormField(
                      controller: _nameFiled,
                      decoration: InputDecoration(
                          label: Text('الاسم'),
                          hintText: 'اسم الشخص المراد الارسال له'),
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      onSaved: (newValue) => name = newValue!,
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'الرجاء كتابة اسم الشخص المراد الارسال له';
                      },
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    TextFormField(
                      controller: _locationFiled,
                      decoration: InputDecoration(
                          label: Text('المكان'),
                          hintText: 'المكان المراد اللقاء فيه'),
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      onSaved: (newValue) => city = newValue!,
                      validator: (value) {
                        if (value!.isEmpty) return 'الرجاء كتابة مكان اللقاء';
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () async {
                              date = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime.now()
                                          .subtract(Duration(days: 700)),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 700))) ??
                                  DateTime.now();
                              setState(() {});
                            },
                            child:
                                Text('${date.year}/${date.month}/${date.day}')),
                        IconButton(
                            onPressed: resetItems,
                            icon: Icon(Icons.restore_page_rounded)),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                screenIndex = 0;
                              });
                            },
                            child: Text('الغاء')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  screenIndex = 2;
                                }
                              });
                            },
                            child: Text('معاينة')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
    }
    //
    //
    else {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                icon: Icon(Icons.arrow_back_ios)),
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
                            height: 120, image: AssetImage('assets/$num.png'))),
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
                            'عزيز/ $name \n سأسعد برؤيتك يوم ${dateToString(date)}, \nفي مدينة $city\n\nمع تحياتي,\nداش',
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    cards.add(CardInfo(
                        city: city,
                        date: date,
                        reciverName: name,
                        imageNum: num));
                    screenIndex = 0;
                    resetItems();
                  },
                  child: Text('حفظ')),
            ],
          ),
        ),
      );
    }
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
