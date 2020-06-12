import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _tipPercentaje=0.0;
  double _billAmount=0.0;
  double _total=0.0;
  final _estiloTexto = new TextStyle(fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator App',
      home: Scaffold(
      
        appBar: AppBar(
          title: Text('Tip Calculator App'),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _crearCuenta(),
              _crearPorcentaje(),
              _crearBoton(),
              Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Container(
                      //color: Colors.green,
                      padding:EdgeInsets.symmetric(horizontal: 0,vertical: 270),
                    child: Text('Total:\$$_total',style: _estiloTexto),

                   )
                 ],

              )
              //Text('data',style: _estiloTexto),
              //Text('data',style: _estiloTexto),
              /*
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('data1',style: _estiloTexto),
                  Container(
                    
                    
                    padding:EdgeInsets.symmetric(horizontal: 0,vertical: 300),
                    child: Text('data',style: _estiloTexto),

                  )*/
                  

                ],
              ),

            
          ),
        ),
      
      );
    
  }

  Widget _crearCuenta(){
    
    return TextField(
      
      decoration: InputDecoration(hintText:"total de la cuenta" ,contentPadding: EdgeInsets.all(10)),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          _billAmount= double.parse(value);
        }
        catch(exception){

          _billAmount=0.0;
        }
      },
     );
  
}

Widget _crearPorcentaje(){
  return TextField(
      decoration: InputDecoration(labelText: "tip %", hintText:"15",contentPadding: EdgeInsets.all(10)),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          _tipPercentaje=double.parse(value);
        }catch(exception){
          _tipPercentaje=0.0;
        }
      },
    );

}

Widget _crearBoton(){
  return RaisedButton(
     child: Text('Calculate'),
     onPressed: (){
       double calculatedTip = (_billAmount* _tipPercentaje)/100.0;
       setState(() {
         _total= _billAmount+calculatedTip;
           print(_total);
         
       });            
                      
     });
}


}


