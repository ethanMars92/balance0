import 'package:balance/korek.dart';
import 'package:balance/zain.dart';
import 'package:flutter/material.dart';
import 'widgetFunctions.dart';
import 'constants.dart';

class Asiacell extends StatefulWidget {
  static const id = 'Asiacell';

  @override
  _Asiacelltate createState() => _Asiacelltate();
}

class _Asiacelltate extends State<Asiacell> {
  void initState() {
    // TODO: implement initState
    super.initState();
    checkingAndRequestingPermission();
    selectedGroup = '0770';
    briBalans = '1000';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: Text('باڵانسی ئاسیاسێڵ'),
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

//                        Navigator.pushNamed(context, Korek.id);

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
                            Text('کۆڕەك')
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
                              'images/asiacell.png',
                              width: 100,
                            ),
                          ),
                          Text(
                            'ئاسیاسێڵ',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sendingBalanceControler.text = "";
                        briBalanceController.text = "";
                        contactNumberController.text = "";
                        refillingBalancetextEditingController.text = "";

//                        Navigator.pushNamed(context, Zain.id);
                        Navigator.pushReplacementNamed(context, Zain.id);
                      },
                      child: Card(
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
                            Text('زەین')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                refillingCardWidget("AsiaCell"),
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
                              subtitle: Text('نمونە: 456 123 0770'),
                              title: Text('0770'),
                              value: '0770',
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
                                title: Text('0771'),
                                subtitle: Text('نمونە: 456 123 0771'),
                                activeColor: Colors.blue,
                                value: '0771',
                                groupValue: selectedGroup,
                                onChanged: (val) {
                                  setState(() {
                                    selectedGroup = val;
                                    print(selectedGroup);
                                  });
                                }),
                            RadioListTile(
                              subtitle: Text('نمونە: 456 123 0772'),
                              title: Text('0772'),
                              value: '0772',
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
                              subtitle: Text('نمونە: 456 123 0773'),
                              title: Text('0773'),
                              value: '0773',
                              groupValue: selectedGroup,
                              onChanged: (val) {
                                setState(() {
                                  selectedGroup = val;
                                  print(selectedGroup);
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                        TextField(
                          controller: briBalanceController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: DYARI_KRDNI_BRI_BALANS,
                        ),
                        SIZED_BOX,
                        halbzhardniListiNawakanUNardn(briBalans, selectedGroup,
                            context, ASIA_SENDING_BALANCE_CODE),
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
