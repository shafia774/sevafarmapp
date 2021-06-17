import 'package:flutter/material.dart';
import 'cerealprod.dart';
import 'package:sevafarm_app/appscreens/cerealprod-api.dart';
import 'cart.dart';
class cerealpage extends StatefulWidget {


  @override
  _cerealpageState createState() => _cerealpageState();
}

class _cerealpageState extends State<cerealpage> {
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



      title: Text('CEREALS',
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF46EA13)
        ),),)
      ,body:Container(


          child:FutureBuilder(
            future: fetchCerealprod(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data.length ,
                  shrinkWrap:true,
                  itemBuilder: (BuildContext context,index){
                    Cerealprod product =snapshot.data[index];
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