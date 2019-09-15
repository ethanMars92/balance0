import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:intent/action.dart' as actions;
import 'package:intent/intent.dart' as intents;
import 'package:native_contact_picker/native_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';

TextEditingController refillingBalancetextEditingController =
    TextEditingController();
TextEditingController korekSendingBalanceController = TextEditingController();
TextEditingController korekBriBalanceController = TextEditingController();
TextEditingController korekContactNumberController = TextEditingController();
TextEditingController asiaSendingBalanceController = TextEditingController();
TextEditingController asiaBriBalanceController = TextEditingController();
TextEditingController asiaContactNumberController = TextEditingController();
TextEditingController zainSendingBalanceController = TextEditingController();
TextEditingController zainBriBalanceController = TextEditingController();
TextEditingController zainContactNumberController = TextEditingController();

var selectedRadio = 0750;

/// am functiona be kesha esh akat
Widget refillingCardWidget(String provider) {
  String str1 = provider;
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
                  onPressed: () {
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
Widget RAISEDBUTTON() {
  return RaisedButton(
    onPressed: () {
//                  intents.Intent()
//                    ..setAction(actions.Action.ACTION_CALL)
//                    ..setData(
//                      Uri(scheme: 'tel', path: '$KOREK_BALANCE_CHECKER'),
//                    )
//                    ..startActivity().catchError((e) => print(e));
      print(korekContactNumberController.text);
    },
    child: Text(
      'بنێرە',
      style: BUTTON_STYLE_TEXT,
    ),
  );
}

///krdnaway listi nawakan
openContact(String numberCode, String sendingCode, String briBalance) async {
  String pureNumber;
  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact = await _contactPicker.selectContact();
  pureNumber = _contact.phoneNumber
      .replaceAll(RegExp(r"\s+\b|\b\s"), "")
      .replaceAll('+', "")
      .replaceAll('-', "");

  if (pureNumber.length > 7) {
    korekContactNumberController.text =
        '$sendingCode${pureNumber.substring(pureNumber.length - 7)}*$briBalance$HASH_SIGN';
  }
}

/// peshknin u dawa krdni permission
checkingAndRequestingPermission() async {
  var _permissionHandler =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
  if (_permissionHandler.value != 1) {
    await PermissionHandler().requestPermissions([PermissionGroup.phone]);
  }
}

/// function bo daxl krdni kard
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
