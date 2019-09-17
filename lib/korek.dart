import 'package:balance/asiacell.dart';
import 'package:balance/zain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgetFunctions.dart';
import 'constants.dart';

class Korek extends StatefulWidget {
  static const id = 'korek';

  @override
  _KorekState createState() => _KorekState();
}

class _KorekState extends State<Korek> {
  void initState() {
    // TODO: implement initState
    super.initState();
    checkingAndRequestingPermission();
    selectedGroup = '0750';
    briBalans = '1000';
    sliderValue = '1000';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        minimum: EdgeInsets.all(0),
        child: Scaffold(
          backgroundColor: Colors.blue[300],
          appBar: AppBar(
            title: Text('باڵانسی کۆڕەك'),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        color: Colors.black,
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
                      GestureDetector(
                        onTap: () {
                          sendingBalanceControler.text = "";
                          briBalanceController.text = "";
                          contactNumberController.text = "";
                          refillingBalancetextEditingController.text = "";
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
                  refillingCardWidget('Korek'),
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
                                subtitle: Text('نمونە: 456 123 0750'),
                                title: Text('0750'),
                                value: '0750',
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
                                  // secondary: Icon(MdiIcons),
                                  title: Text('0751'),
                                  subtitle: Text('نمونە: 456 123 0751'),
                                  activeColor: Colors.blue,
                                  value: '0751',
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
                              briBalans,
                              selectedGroup,
                              context,
                              KOREK_SENDING_BALANCE_CODE),
                          SIZED_BOX,
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                isContactFieldEnable = true;
                              });
                            },
                            child: Text('ژمارەکەت لانیە ؟'),
                          ),
                          SIZED_BOX,
                          TextField(
                            enabled: isContactFieldEnable,
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
      ),
    );
  }
}
