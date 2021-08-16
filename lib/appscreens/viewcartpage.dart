
import 'package:flutter/material.dart';
import 'cart.dart';
import 'order-api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Viewpricepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class viewcartpage extends StatefulWidget {
  @override
  _viewcartpageState createState() => _viewcartpageState();
}

class _viewcartpageState extends State<viewcartpage> {
  Cart cart;
  List<TextEditingController> _controllers;

  void initState() {
    cart = new Cart();
    _controllers = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).mycart,
            style: TextStyle(
                fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF46EA13)),
          ),
        ),
        body: cart.items.length > 0
            ? Column(children: [
          Expanded(
              child: ListView.builder(
                // Let the ListView know how many items it needs to build.
                  itemCount: cart.items.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = cart.items[index];

                    return CartListItem(cart: cart,index: index);
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                  child:Text(AppLocalizations.of(context).total ),
                  onPressed: () async{
                    cart.items.forEach((element) async {
                      await placeOrder(product: element.item,quantity: element.quantity);

                      setState(() {
                       cart.items.remove(element);
                      });
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewpricePage()));})
            ],
          )
        ])
            : Center(child: Text(AppLocalizations.of(context).not)));
  }
}

class CartListItem extends StatefulWidget{
  final Cart cart;
  final int index;
  const CartListItem({this.cart,this.index});
  @override
  CartListItemState createState() => CartListItemState();
}

class CartListItemState extends State<CartListItem> {
  bool deleted = false;
  TextEditingController controller;
  Cart cart;
  int index;
  int quantity = 0;
  @override
  void initState() {
    cart = widget.cart;
    index = widget.index;
    controller = new TextEditingController();
    controller.text = cart.items[index].quantity;
    quantity = int.parse(cart.items[index].quantity);
    controller.addListener(() {

      cart.modifyItemQuantity(name: cart.items[index].item,quantity: controller.value.text);
      setState(() {
        quantity = int.parse(controller.value.text);
      });
    });
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return !deleted ? ListTile(
        title: Text(cart.items[index].item.toString()),
        //subtitle: Text('\u{20B9}'+cart.items[index].totalPrice.toString()),
        trailing: new Container(
          width: 250.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: TextField(keyboardType: TextInputType.number,
                  onChanged: (qty) {},
                  controller: controller,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration:
                  new InputDecoration.collapsed(
                      hintText: 'qty'),
                  // controller: new TextEditingController(),
                ),
              ),
              Expanded(
                  flex: 1,
                  child:Text('x \u{20B9}'+cart.items[index].price,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.9,
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child:Text('\u{20B9}'+ ( quantity * int.parse(cart.items[index].price) ).toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
              ),
              new Expanded(
                child: new IconButton(
                  icon: new Icon(Icons.delete),
                  color: Colors.black26,
                  onPressed: () {
                    widget.cart.items.removeWhere((element) => element.item == widget.cart.items[index].item );
                    setState(() {
                      deleted = true;
                    });
                  },
                ),
              )
            ],
          ),
        )):Container();
  }
}
