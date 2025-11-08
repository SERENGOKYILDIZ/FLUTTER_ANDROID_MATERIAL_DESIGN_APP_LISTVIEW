import 'package:android_flutter_material_design_app_listview/Yemeksayfasi.dart';
import 'package:flutter/material.dart';
import 'yemek.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Yemek>> yemekleriGetir() async {
    var yemekListesi = <Yemek>[];

    var y1 = Yemek(
        yemek_id: 1,
        yemek_adi: "Ayran",
        yemek_resimi: "ayran.jpeg",
        yemek_fiyati: 15.99
    );
    var y2 = Yemek(
        yemek_id: 2,
        yemek_adi: "Fanta",
        yemek_resimi: "fanta.jpeg",
        yemek_fiyati: 2
    );
    var y3 = Yemek(
        yemek_id: 3,
        yemek_adi: "Köfte",
        yemek_resimi: "kofte.jpeg",
        yemek_fiyati: 20.99
    );
    var y4 = Yemek(
        yemek_id: 4,
        yemek_adi: "Kola",
        yemek_resimi: "kola.jpeg",
        yemek_fiyati: 17.99
    );
    var y5 = Yemek(
        yemek_id: 5,
        yemek_adi: "Makarna",
        yemek_resimi: "makarna.jpeg",
        yemek_fiyati: 57.89
    );

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemek>>(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              var yemekler = snapshot.data;
              return ListView.builder(
                itemCount: yemekler!.length,
                itemBuilder: (context, indeks) {
                  var yemek = yemekler[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Yemeksayfasi(yemek: yemek)));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset("images/${yemek.yemek_resimi}")
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${yemek.yemek_adi}", style: TextStyle(fontSize: 20)),
                                SizedBox(height: 50),
                                Text("${yemek.yemek_fiyati} \u{20BA}", style: TextStyle(fontSize: 25, color: Colors.indigoAccent)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          else
            {
              return Center();
            }
        },
      )
    );
  }
}
