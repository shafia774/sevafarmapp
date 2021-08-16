import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sevafarm_app/appscreens/homepage.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();

}

class _OrderPlacedState extends State<OrderPlaced> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).order,
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
                    AppLocalizations.of(context).ys,
                    style:
                    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color:Colors.lightGreen),
                  ),
                ),

              ],
            ),
          ),Container(padding: EdgeInsets.fromLTRB(240.0, 200.0, 0.0, 0.0),
              child: RaisedButton(
                  child: Text(AppLocalizations.of(context).homepage),
                  onPressed: () async {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage()));
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