import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:intent/action.dart' as actions;
import 'package:intent/intent.dart' as intents;
import 'package:native_contact_picker/native_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController refillingBalancetextEditingController =
    TextEditingController();
TextEditingController sendingBalanceControler = TextEditingController();
TextEditingController briBalanceController = TextEditingController();
TextEditingController contactNumberController = TextEditingController();

/// am functiona be kesha esh akat
Widget refillingCardWidget(String provider) {
  String str1 = provider;
  int maxTextFieldLength = 13;
  return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'بۆ پڕکردنەوەی باڵانس',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SIZED_BOX,
            TextField(
              controller: refillingBalancetextEditingController,
              maxLength: maxTextFieldLength,
              cursorColor: Colors.red,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: preIcon,
                labelText: '   ژمارەی کارت ',
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                hintText: 'تکایە ژمارەی سەر کارتەکە وەك خۆی بنوسەوە',
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                focusedBorder: FOCUSED_BORDER_STYLE,
                enabledBorder: ENABLED_BORDER_STYLE,
              ),
            ),
            SIZED_BOX,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  onPressed: (refillingBalancetextEditingController
                              .text.isEmpty ||
                          refillingBalancetextEditingController.text.length <
                              maxTextFieldLength)
                      ? null
                      : () {
                          print('Provideer is: $str1');
                          refillingBalance(provider);
                        },
                  child: Text(
                    'پڕبکەوە',
                    style: BUTTON_STYLE_TEXT,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                    onPressed: () {
                      print('I am working');
                      intents.Intent()
                        ..setAction(actions.Action.ACTION_CALL)
                        ..setData(
                          Uri(scheme: 'tel', path: '$KOREK_BALANCE_CHECKER'),
                        )
                        ..startActivity().catchError((e) => print(e));
                    },
                    child: Text(
                      'زانینی باڵانس',
                      style: BUTTON_STYLE_TEXT,
                    )),
              ],
            ),
          ],
        ),
      ));
}

/// dugmay nardn
Widget RAISEDBUTTON(context) {
  return RaisedButton(
    disabledTextColor: Colors.white,
    onPressed: briBalanceController.text.isEmpty
        ? null
        : () {
//                  intents.Intent()
//                    ..setAction(actions.Action.ACTION_CALL)
//                    ..setData(
//                      Uri(scheme: 'tel', path: '$KOREK_BALANCE_CHECKER'),
//                    )
//                    ..startActivity().catchError((e) => print(e));
            print(contactNumberController.text);
          },
    child: Text(
      'بنێرە',
      style: BUTTON_STYLE_TEXT,
    ),
  );
}

///krdnaway listi nawakan
//eshakat bo krdnawa u nishandani contact list u keshay nya

Widget halbzhardniListiNawakanUNardn(
    String briBalance, String selectedGroup, context, String sendingCode) {
  return OutlineButton.icon(
    onPressed: briBalanceController.text.isEmpty
        ? null
        : () {
            briBalans = briBalanceController.text;

            openContact(selectedGroup, sendingCode, briBalans, context);
          },
    icon: Icon(Icons.contact_phone),
    label: Text('ژمارەی کەسەکە هەڵبژێرە'),
  );
}

Future openContact(
    String numberCode, String sendingCode, String briBalance, context) async {
  String _pureNumber;
  String _contactName;

  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact = await _contactPicker.selectContact();
  _pureNumber = _contact.phoneNumber
      .replaceAll(RegExp(r"\s+\b|\b\s"), "")
      .replaceAll('+', "")
      .replaceAll('-', "");
  _contactName = _contact.fullName;

  alert(
      context, numberCode, sendingCode, briBalance, _pureNumber, _contactName);
}

// !Alert function babe kesha esh akat
//TODO tanha design mawa agar wistm bikam
alert(context, String numberCode, String sendingCode, String briBalance,
    String pureNumber, String contactName) {
  String phoneNumber;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            semanticLabel: 'ئاگاداری',
            title: Text('دڵنیابوونەوە'),
            content:
                Text("دڵنیای لە ناردنی $briBalance دینارە بۆ $contactName ؟"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  /// lagal click krdn lera abet balansaka bnerdret
                  switch (sendingCode) {
                    case ASIA_SENDING_BALANCE_CODE:
                      if (pureNumber.length > 7) {
                        phoneNumber =
                            '$sendingCode$briBalance*$numberCode${pureNumber.substring(pureNumber.length - 7)}$HASH_SIGN';
                        intents.Intent()
                          ..setAction(actions.Action.ACTION_CALL)
                          ..setData(
                            Uri(scheme: 'tel', path: phoneNumber),
                          )
                          ..startActivity().catchError((e) => print(e));
                        print(contactNumberController.text);
                      }
                      break;
                    case KOREK_SENDING_BALANCE_CODE:
                      if (pureNumber.length > 7) {
                        phoneNumber =
                            '$sendingCode$numberCode${pureNumber.substring(pureNumber.length - 7)}*$briBalance$HASH_SIGN';

                        intents.Intent()
                          ..setAction(actions.Action.ACTION_CALL)
                          ..setData(
                            Uri(scheme: 'tel', path: phoneNumber),
                          )
                          ..startActivity().catchError((e) => print(e));
                        print(contactNumberController.text);
                      }
                      break;
                  }
                  Navigator.pop(context);
                },
                child: Text('بەڵێ'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('نەخێر'),
              ),
            ],
          ),
        );
      });
}

/// peshknin u dawa krdni permission
// be kesha esh akat
checkingAndRequestingPermission() async {
  var _permissionHandler =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
  if (_permissionHandler.value != 1) {
    await PermissionHandler().requestPermissions([PermissionGroup.phone]);
  }
}

//be kesha esh akat
void refillingBalance(String str) {
  switch (str) {
    case 'Korek':
      print('I am working');
      intents.Intent()
        ..setAction(actions.Action.ACTION_CALL)
        ..setData(
          Uri(
              scheme: 'tel',
              path:
                  '$KOREK_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN'),
        )
        ..startActivity().catchError((e) => print(e));
      print(
          '$KOREK_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN');
      break;
    case 'AsiaCell':
      print('I am working');
      intents.Intent()
        ..setAction(actions.Action.ACTION_CALL)
        ..setData(
          Uri(
              scheme: 'tel',
              path:
                  '$ASIA_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN'),
        )
        ..startActivity().catchError((e) => print(e));
      print(
          '$ASIA_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN');
      break;
    case 'Zain':
      print('I am working $str');
      intents.Intent()
        ..setAction(actions.Action.ACTION_CALL)
        ..setData(
          Uri(
              scheme: 'tel',
              path:
                  '$ZAIN_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN'),
        )
        ..startActivity().catchError((e) => print(e));
      print(
          '$ZAIN_BALANCE_REFFILING_CODE${refillingBalancetextEditingController.text}$HASH_SIGN');
  }
}

//TODO lawanaya la dahatu functionek zyad bkam bo nardnni balance bo Zain ba SMS
