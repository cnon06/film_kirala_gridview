
import 'package:flutter/material.dart';
import 'package:untitled42/Filmler.dart';

class DetaySayfa extends StatefulWidget {

 Filmler film;


 DetaySayfa(this.film);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.film.film_adi}"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset("images/${widget.film.film_resim_adi}.jpg")),
          //  Text("${widget.film.film_adi}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text("${widget.film.film_fiyat} \u{20BA}",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.purple)),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(

                  onPressed: ()
                  {
                    print('${widget.film.film_adi} kiralandı.');
                  }
                  , child: Text("Kirala", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
            )
          ],

        ),
      ),

    );
  }
}
