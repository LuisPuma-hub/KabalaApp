import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tonica_fundamental extends StatefulWidget{
  final int day,month,year;
  final String name, lastname;
  tonica_fundamental(this.day,this.month,this.year,this.name,this.lastname);
  @override
  _tonica_fundamentalState createState() => _tonica_fundamentalState();
}

class _tonica_fundamentalState extends State<tonica_fundamental> {
  String name;
  String lastName;
  String dia;
  String mes;
  String year;

  @override
  void initState() {
    // TODO: implement initState
    name=widget.name;
    lastName=widget.lastname;
    dia=widget.day.toString();
    mes=widget.month.toString();
    year=widget.year.toString();
  }
  @override
  Widget build(BuildContext context) {



    int longitudSinEspacios(String palabra){
      int contador = 0;
      for(int i = 0; i < palabra.length; i++){
        if(palabra.substring(i, i+1) != " "){
          contador++;
        }
      }
      return contador;
    }

    int sumaDeCifras(int numero){
      int suma = 0;
      for(int i = 0; i < numero.toString().length; i++){
        suma += int.parse(numero.toString().substring(i, i+1));
      }
      return suma;
    }

    int urgenciaInterior = sumaDeCifras(sumaDeCifras(sumaDeCifras(int.parse(dia))) + sumaDeCifras(sumaDeCifras(int.parse(mes))) + sumaDeCifras(sumaDeCifras(int.parse(year))));
    int longitudNombreCompleto = longitudSinEspacios(name) + longitudSinEspacios(lastName);
    int sumaLongituNombreCompleto = sumaDeCifras(longitudNombreCompleto);
    int tonicaFundamental = sumaDeCifras(urgenciaInterior + sumaLongituNombreCompleto);

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados", style: TextStyle(fontStyle: FontStyle.italic)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name + " " + lastName),
            Text(dia + "/" + mes + "/" + year),
            Text("Urgencia interior: " + urgenciaInterior.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Tonica fundamental: " + tonicaFundamental.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          ],
        ),
      ),
    );
  }
}

//CODIGO ORIGINAL

/*
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SecondPageArguments arguments = ModalRoute.of(context).settings.arguments;

    int longitudSinEspacios(String palabra){
      int contador = 0;
      for(int i = 0; i < palabra.length; i++){
        if(palabra.substring(i, i+1) != " "){
          contador++;
        }
      }
      return contador;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(arguments.name),
            Text(arguments.lastName),
            Text(longitudSinEspacios(arguments.name).toString()),
            Text(longitudSinEspacios(arguments.lastName).toString()),
          ],
        ),
      ),
    );
  }
}

class SecondPageArguments{
  String name;
  String lastName;
  SecondPageArguments({this.name, this.lastName});
}
*/