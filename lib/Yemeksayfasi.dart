import 'package:android_flutter_material_design_app_listview/yemek.dart';
import 'package:flutter/material.dart';

class Yemeksayfasi extends StatefulWidget {

  Yemek yemek;

  Yemeksayfasi({required this.yemek});

  @override
  State<Yemeksayfasi> createState() => _YemeksayfasiState();
}

class _YemeksayfasiState extends State<Yemeksayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("${widget.yemek.yemek_adi}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 400,
                height: 400,
                child: Image.asset("images/${widget.yemek.yemek_resimi}")
            ),
            Text("${widget.yemek.yemek_fiyati} \u{20BA}", style: TextStyle(fontSize: 48, color: Colors.indigoAccent)),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("SİPARİŞ VER"),
                  onPressed: (){
                    print("${widget.yemek.yemek_adi} sipariş verildi!");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
