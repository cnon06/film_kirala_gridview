import 'package:flutter/material.dart';
import 'package:untitled42/DetaySayfa.dart';
import 'package:untitled42/Filmler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    Future <List<Filmler>> filmleriGetir() async
    {

      var filmlerlistesi= <Filmler>[];

      filmlerlistesi.add(new Filmler(1, "Avangers", "avangers", 23));
      filmlerlistesi.add(new Filmler(2, "Avatar", "avatar", 11));
      filmlerlistesi.add(new Filmler(3, "Clockwork Orange", "clockwork", 46));
      filmlerlistesi.add(new Filmler(4, "The Dark Knight", "darkknight", 87));
      filmlerlistesi.add(new Filmler(5, "The Godfather", "godfather", 65));
      filmlerlistesi.add(new Filmler(6, "The Lord of The Rings", "lord", 28));
      filmlerlistesi.add(new Filmler(7, "Mortal Kombat", "mortalkombat", 74));
      filmlerlistesi.add(new Filmler(8, "Scent of Woman", "scent", 55));
      filmlerlistesi.add(new Filmler(9, "Shawshank Redemption", "shawshank", 44));
      filmlerlistesi.add(new Filmler(10, "Under The Bed", "underthebed", 27));



      return filmlerlistesi;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context,snaphot)
          {

            if(snaphot.hasData)
              {
                var filmListesi=snaphot.data;

                return GridView.builder(
                    itemCount: filmListesi!.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 2/3.5,
                    ),

                  itemBuilder: (context,index)
                  {
                    var film = filmListesi[index];

                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film)));
                      },
                      
                      child: Card(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset("images/${film.film_resim_adi}.jpg")),
                            Text("${film.film_adi}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text("${film.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 16)),

                          ],
                        ),

                      ),
                    );


                  },


                );
              }
            else
              {
                return Center(child: Text("Veri Alınamdı."),);
              }

          },

      ),

    );
  }
}
