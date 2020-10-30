import 'package:flutter/material.dart';
class tonica_dia extends StatefulWidget {
  final int day,month,year;
  final String name, lastname;

  tonica_dia(this.day,this.month,this.year,this.name,this.lastname);
  @override
  _tonica_diaState createState() => _tonica_diaState();
}
class _tonica_diaState extends State<tonica_dia> {
  String name,lastname,dy,mt,yr;
  DateTime selectDate= DateTime.now();
  int day,month,year;
  void initState() {

    name=widget.name;
    lastname=widget.lastname;
    dy=widget.day.toString();
    mt=widget.month.toString();
    yr=widget.year.toString();
    day = selectDate.day;
    month=selectDate.month;
    year=selectDate.year;
  }
  int dayCabale(int day, int most, int year, int tf) {
    int sum,d,m,y,total;
    y=suma(year);
    m=suma(most);
    d=suma(day);
    total=suma(d+m+y);
    total=suma(total+tf);
    return total;
  }
  int suma(int numero) {
    int suma =0;
    int num;
    for(int i =0;i < numero.toString().length ; i++){
      num = int.parse(numero.toString().substring(i, i+1));
      suma +=num;
    }
    return suma;
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

    int urgenciaInterior = sumaDeCifras(sumaDeCifras(sumaDeCifras(int.parse(dy))) + sumaDeCifras(sumaDeCifras(int.parse(mt))) + sumaDeCifras(sumaDeCifras(int.parse(yr))));
    int longitudNombreCompleto = longitudSinEspacios(name) + longitudSinEspacios(lastname);
    int sumaLongituNombreCompleto = sumaDeCifras(longitudNombreCompleto);
    int tonicaFundamental = sumaDeCifras(urgenciaInterior + sumaLongituNombreCompleto);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        titleSpacing: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tonica del Dia',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _selectDate(context), // Refer step 3
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.perm_contact_calendar_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Fecha de Nacimiento',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      color: Colors.indigo[800],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration:
                    BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.indigo[800], spreadRadius: 0.75),
                        ]
                    ),
                    child: Center(child: Text('${selectDate.day}/${selectDate.month}/${selectDate.year}')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration:
                    BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.indigo[800], spreadRadius: 0.75),
                        ]
                    ),
                    child: Center(child: Text(dayCabale(day, month, year, tonicaFundamental).toString())),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration:
                    BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.indigo[800], spreadRadius: 0.75),
                        ]
                    ),
                    child: Center(
                        child:
                        Text(urgenciaInterior.toString()
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration:
                    BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.indigo[800], spreadRadius: 0.75),
                        ]
                    ),
                    child: Center(
                        child:
                        Text(tonicaFundamental.toString())
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  _selectDate(BuildContext context) async {

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime(2021),
    );
    print('$selectDate');
    if (picked != null && picked != selectDate)
      setState(() {
        selectDate = picked;
        day=selectDate.day;
        month=selectDate.month;
        year=selectDate.year;
        print('$day-$month-$year');
      });

  }
}