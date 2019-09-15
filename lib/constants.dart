//constantakan bo la kati daxl krdni kart bakar den
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/intent.dart' as intents;
import 'package:intent/action.dart' as actions;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// BO PR KRDNAWAY BALANCE
const KOREK_BALANCE_REFFILING_CODE = '*221*';
const ASIA_BALANCE_REFFILING_CODE = "*133*";
const ZAIN_BALANCE_REFFILING_CODE = '*151#';
const HASH_SIGN = '#';
//constant bo zanini balance
const KOREK_BALANCE_CHECKER = '*211#';
const ASIAN_BALANCE_CHECKER = '*333#';
const ZAIN_BALANCE_CHECKER = "*200#";

// bo balance nardn am koda pewista {.. *215* zhmaray talafon *1000 # ..}
const KOREK_SENDING_BALANCE_CODE = '*215*';
const ASIA_SENDING_BALANCE_CODE = '*123*';

//..........
//..........
//..........
const SIZED_BOX = SizedBox(
  height: 10.5,
);
const FOCUSED_BORDER_STYLE = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
  borderSide: BorderSide(
    width: 1,
    color: Colors.blue,
    style: BorderStyle.solid,
  ),
);
const ENABLED_BORDER_STYLE = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
  borderSide: BorderSide(
    width: 1,
    color: Colors.black,
    style: BorderStyle.solid,
  ),
);
const BUTTON_STYLE_TEXT = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const preIcon = Icon(MdiIcons.cardBulletedOutline);

/// NARDNI BALANCE TECFIELD
const DYARI_KRDNI_BRI_BALANS = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10),
  prefixIcon: Icon(MdiIcons.numeric),
  labelText: 'بڕی باڵانس',
  labelStyle:
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
  hintText: 'ئەو بڕە باڵانسە بنوسە کە ئەتەوێت بینیێری',
  hintStyle: TextStyle(
    fontSize: 12,
  ),
  focusedBorder: FOCUSED_BORDER_STYLE,
  enabledBorder: ENABLED_BORDER_STYLE,
);

/// NUSINI ZHMARAY KASAKA
const NUSINI_ZHMARAY_KASAKA = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10),
  prefixIcon: Icon(Icons.phone),
  labelText: 'ژمارەی کەسەکە',
  labelStyle:
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
  hintText: 'تکایە ژمارەکە بە دروستی بنوسە',
  hintStyle: TextStyle(
    fontSize: 12,
  ),
  helperText: 'ئەگەر ژمارەی کەسەکەت لابێت، پێویست ناکات ژمارەکەی بنوسیت',
  focusedBorder: FOCUSED_BORDER_STYLE,
  enabledBorder: ENABLED_BORDER_STYLE,
);

/// RoundedRectangleBorder
const ROUNDED_RECTANGULAR_BORDER =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)));
