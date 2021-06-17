import 'package:flutter/material.dart';
import 'pulseprod-api.dart';
import 'pulseprod.dart';
import 'cart.dart';
class pulsespage extends StatefulWidget {


  @override
  _pulsespageState createState() => _pulsespageState();
}

class _pulsespageState extends State<pulsespage> {
  Cart cart;
  void initState() {
    cart=new Cart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,



      title: Text('PULSES',
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF46EA13)
        ),),)
      ,body:Container(


          child:FutureBuilder(
            future: fetchPulseprod(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data.length ,
                  shrinkWrap:true,
                  itemBuilder: (BuildContext context,index){
                    Pulseprod product =snapshot.data[index];
                    return Card(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment:CrossAxisAlignment.start,
                            children: [

                              Text('${product.product}',style: TextStyle(fontSize:20)),

                              Text('${product.quantity}',style: TextStyle(fontSize:15))

                            ],
                          ),
                          RaisedButton(
                            onPressed: (){
                              cart.addItem(CartItem(item:product.product,quantity: '1'));
                            },
                            child: Text('Add to Cart'),
                          )
                        ],
                      ),
                    );
                  },);}
              return CircularProgressIndicator();
            },
          )
      ),);}}