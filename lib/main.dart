import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent
    ),
    debugShowCheckedModeBanner: false,
      
    title: 'Simple Interest Calculator',
    home:MyApp(),
  
  ));
}

class MyApp extends StatefulWidget{
  @override
 State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _SIForm();
  }
}
class _SIForm extends State<MyApp>{
   var _currentcurrency= ['Rupees','Dollar','Pounds'];
   final _minimumPadding=0.5;
   var displayResult='';
   
TextEditingController principleEditControlar= TextEditingController();
TextEditingController rateEditControlar= TextEditingController();
TextEditingController termEditControlar= TextEditingController();
    var _currentySekectedItem='';
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentySekectedItem=_currentcurrency[0];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle= Theme.of(context).textTheme.title;

    return  Scaffold(appBar:  AppBar(
      title: Text('Simple Interest Calculator'),
          ),
          body: Container(
            child: ListView(children: <Widget>[
           getImageAsset(),
       Padding( padding:EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
        child:  TextField(
          controller: principleEditControlar,
          style: textStyle,
            keyboardType:TextInputType.number,
           decoration: InputDecoration(
             
             labelText: 'Principle',
             labelStyle: textStyle,
             hintText: 'Enter Principal e.g. 12000',
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                        ),
         ),),
      Padding( padding:EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
        child: TextField(
          controller: rateEditControlar,
          style: textStyle,
            keyboardType:TextInputType.number,
           decoration: InputDecoration(
             labelText: 'Rate of Interst',
             labelStyle: textStyle,
             hintText: 'In Percent',
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                        ),
         ),),
       Padding(  padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding), 
         child:Row(children: <Widget>[
          Expanded(child: TextField(
            controller: termEditControlar,
            style: textStyle,
            keyboardType:TextInputType.number,
           decoration: InputDecoration(
             labelText: 'Term',
             hintText: 'Time in Year',
             labelStyle: textStyle,
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                        ),
         ),),
         Container(width: _minimumPadding * 5,),
        Expanded(child:  DropdownButton<String>(
            items: _currentcurrency.map((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value:_currentySekectedItem,
            onChanged: (String newValueSelected){
              _onDropdownItemSelected(newValueSelected);

            },
          ))
         ],
         )),
    Padding(  padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
       child: Row(children: <Widget>[
        Expanded(child:   RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
              child: Text('Calculate',style:textStyle,textScaleFactor: 1.5,),
              onPressed: (){
                setState(() {
              this.displayResult=  _onCalculateReturn();
                });

              },
            )),
             Expanded(child:   RaisedButton(
               color: Theme.of(context).primaryColorDark,
               textColor: Theme.of(context).primaryColorLight,
                child: Text('Reset' , style: textStyle, textScaleFactor: 1.5,),
              onPressed: (){
                setState(() {
                  _onReset();
                });

              },
            ))
             
          ],)),
          Padding(padding: EdgeInsets.all(_minimumPadding * 2),
          child: Text(displayResult,
          style: textStyle,),
             ) ])
           ));
            
          
          
  }
  Widget getImageAsset(){
    AssetImage assetImage= AssetImage('assets/math.png');
    Image image= Image(image: assetImage,width: 100,height:100,);
    return Container(child: image,margin: EdgeInsets.all(_minimumPadding *10),);
  }
  void _onDropdownItemSelected(String newValueSelected){
   
    setState(() {
     this. _currentySekectedItem= newValueSelected;
    });

  }
   String _onCalculateReturn(){
     double principle= double.parse(principleEditControlar.text);
     double rate= double.parse(rateEditControlar.text);
     double year= double.parse(termEditControlar.text);
     double totalPayableAmount=principle+(principle*rate*year)/100;
     String result=  'After $year years, Your Investment will be worth $totalPayableAmount $_currentySekectedItem';
     return result;

  }
    void _onReset(){
      principleEditControlar.text='';
      rateEditControlar.text='';
      termEditControlar.text='';
      displayResult='';
      _currentySekectedItem= _currentcurrency[0];


}
}