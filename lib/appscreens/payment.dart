import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sevafarm_app/appscreens/homepage.dart';
import 'order-api.dart';
import 'cart.dart';
import 'package:sevafarm_app/appscreens/orderplaced.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Cart cart = Cart();
  var _payment=['SELECT YOUR PAYMENT METHOD','CASH ON DELIVERY'];
  var currentMethodSelected='SELECT YOUR PAYMENT METHOD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).cod,
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
                SizedBox(height: 20),
                    DropdownButton<String>(
                      items:_payment.map((String dropDownStringItem)
                      {
                        return DropdownMenuItem<String>(
                          value:dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );

                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          this.currentMethodSelected=newValue;
                        });
                      },
                      value: this.currentMethodSelected,


                    )


              ],
            ),
          ),Container(padding: EdgeInsets.fromLTRB(240.0, 200.0, 0.0, 0.0),
              child:PayButton(),

          ),],),),);
  }
}

class PayButton extends StatelessWidget{
  final Cart cart = new Cart();
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(AppLocalizations.of(context).cod),
        onPressed: ()  {Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderPlaced()));
          cart.items.forEach((element) async {
            await placeOrder(product: element.item,quantity: element.quantity);
              cart.items.remove(element);
          });
          // print('here');
          Fluttertoast.showToast(
            msg: AppLocalizations.of(context).ys,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.greenAccent,
            fontSize: 20.0,
          );
        });
  }
}