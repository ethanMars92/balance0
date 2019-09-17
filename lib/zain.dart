import 'package:balance/asiacell.dart';
import 'package:balance/constants.dart';
import 'package:balance/korek.dart';
import 'package:flutter/material.dart';
import 'widgetFunctions.dart';

class Zain extends StatefulWidget {
  static const id = 'Zain';

  @override
  _Zaintate createState() => _Zaintate();
}

class _Zaintate extends State<Zain> {
  void initState() {
    // TODO: implement initState
    super.initState();
    checkingAndRequestingPermission();
    selectedGroup = '0780';
    briBalans = '1000';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: Text('باڵانسی زەین'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        sendingBalanceControler.text = "";
                        briBalanceController.text = "";
                        contactNumberController.text = "";
                        refillingBalancetextEditingController.text = "";

                        Navigator.pushReplacementNamed(context, Korek.id);
                      },
                      child: Card(
                        elevation: 5.5,
                        margin: EdgeInsets.all(5.5),
                        shape: ROUNDED_RECTANGULAR_BORDER,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/korek.png',
                                width: 100,
                              ),
                            ),
                            Text(
                              'کۆڕەك',
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sendingBalanceControler.text = "";
                        briBalanceController.text = "";
                        contactNumberController.text = "";
                        refillingBalancetextEditingController.text = "";
//                        Navigator.pushNamed(context, Asiacell.id);
                        Navigator.pushReplacementNamed(context, Asiacell.id);
                      },
                      child: Card(
                        elevation: 5.5,
                        margin: EdgeInsets.all(5.5),
                        shape: ROUNDED_RECTANGULAR_BORDER,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/asiacell.png',
                                width: 100,
                              ),
                            ),
                            Text('ئاسیاسێڵ')
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      elevation: 5.5,
                      margin: EdgeInsets.all(5.5),
                      shape: ROUNDED_RECTANGULAR_BORDER,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/zain.png',
                              width: 100,
                            ),
                          ),
                          Text(
                            'زەین',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                refillingCardWidget('Zain'),
                Card(
                  shape: ROUNDED_RECTANGULAR_BORDER,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'بۆ ناردنی باڵانس',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          'تکایە کۆدی ژمارەکە هەڵبژێرە',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            RadioListTile(
                              subtitle: Text('نمونە: 456 123 0780'),
                              title: Text('0780'),
                              value: '0780',
                              groupValue: selectedGroup,
                              onChanged: (val) {
                                setState(() {
                                  selectedGroup = val;
                                  print(selectedGroup);
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            RadioListTile(
                                title: Text('0781'),
                                subtitle: Text('نمونە: 456 123 0781'),
                                activeColor: Colors.blue,
                                value: '0781',
                                groupValue: selectedGroup,
                                onChanged: (val) {
                                  setState(() {
                                    selectedGroup = val;
                                    print(selectedGroup);
                                  });
                                }),
                            RadioListTile(
                                title: Text('0782'),
                                subtitle: Text('نمونە: 456 123 0782'),
                                activeColor: Colors.blue,
                                value: '0782',
                                groupValue: selectedGroup,
                                onChanged: (val) {
                                  setState(() {
                                    selectedGroup = val;
                                    print(selectedGroup);
                                  });
                                }),
                            RadioListTile(
                                title: Text('0783'),
                                subtitle: Text('نمونە: 456 123 0783'),
                                activeColor: Colors.blue,
                                value: '0783',
                                groupValue: selectedGroup,
                                onChanged: (val) {
                                  setState(() {
                                    selectedGroup = val;
                                    print(selectedGroup);
                                  });
                                }),
                          ],
                        ),
                        TextField(
                          controller: briBalanceController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: DYARI_KRDNI_BRI_BALANS,
                        ),
                        SIZED_BOX,
                        halbzhardniListiNawakanUNardn(
                            briBalans, selectedGroup, context, "Zain"),
                        SIZED_BOX,
                        TextField(
                          textDirection: TextDirection.ltr,
                          controller: contactNumberController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: NUSINI_ZHMARAY_KASAKA,
                        ),
                        SIZED_BOX,
                        RAISEDBUTTON(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
