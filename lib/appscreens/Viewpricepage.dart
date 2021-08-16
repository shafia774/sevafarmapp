import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'cart.dart';
import 'payment.dart';
import 'viewcartpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewpricePage extends StatefulWidget {
  @override
  _ViewpricePageState createState() => _ViewpricePageState();
}

class _ViewpricePageState extends State<ViewpricePage> {


  @override
  Widget build(BuildContext context) {
    Cart cart = new Cart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).total,
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF46EA13)),
        ),
      ),
      body:SingleChildScrollView(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
    Widget>[
    Container(
    child: Stack(
        children: <Widget>[
        Container(
        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
    child: Text(
      AppLocalizations.of(context).tota+ cart.cartTotal().toString(),
    style:
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color:Colors.lightGreen),
    ),
    ),

    ],
    ),
    ),Container(padding: EdgeInsets.fromLTRB(240.0, 200.0, 0.0, 0.0),
        child: RaisedButton(
              child: Text(AppLocalizations.of(context).pa),
              onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
                Fluttertoast.showToast(
                  msg: AppLocalizations.of(context).ys,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.greenAccent,
                  fontSize: 20.0,
                );
              })

      ),],),),);
  }
}