import 'package:flutter/material.dart';
import 'package:flutter_moda_app/detay.dart';

void main(List<String> args) {
  runApp(const ModaApp());
}

class ModaApp extends StatelessWidget {
  const ModaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Bu yapı ile init ederek başlattığımız yapıları dispose ederek sonlandırmış oluruz. Bu şekilde de sistemden alınan kaynakları sistee vermiş oluruz.
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(controller: tabController, tabs: const [
          Tab(
            icon: Icon(
              Icons.more,
              color: Colors.grey,
              size: 16,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 16,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.navigation,
              color: Colors.grey,
              size: 16,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
              size: 16,
            ),
          )
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Moda Uygulaması",
          style: TextStyle(
              fontFamily: "Montserrat",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            color: Colors.grey,
          )
        ],
      ),
      body: ListView(padding: const EdgeInsets.only(top: 10), children: [
        Container(
          height: 140,
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            children: [
              listeElemanlari("assets/model1.jpeg", "assets/chanellogo.jpg"),
              const SizedBox(
                width: 30,
              ),
              listeElemanlari("assets/model2.jpeg", "assets/louisvuitton.jpg"),
              const SizedBox(
                width: 30,
              ),
              listeElemanlari("assets/model3.jpeg", "assets/chloelogo.png"),
              const SizedBox(
                width: 30,
              ),
              listeElemanlari("assets/model1.jpeg", "assets/chanellogo.jpg"),
              const SizedBox(
                width: 30,
              ),
              listeElemanlari("assets/model1.jpeg", "assets/chanellogo.jpg"),
              const SizedBox(
                width: 30,
              ),
              listeElemanlari("assets/model1.jpeg", "assets/chanellogo.jpg"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Material(
            borderRadius: BorderRadius.circular(16),
            elevation: 4,
            child: Container(
              height: 500,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/model1.jpeg"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Daisy",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "34 mins ago",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 11,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 175),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 22,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "This official website features a ribbed knit zipper jacket that is"
                    "modern and stylish. It looks very temparament and is recommend to friends",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Montserrat",
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Detay(img: "assets/modelgrid1.jpeg"))));
                        },
                        child: Hero(
                          // Bu widget animasyon için kullanılır. Gidilen sayfada da aynı animasyonun çağırılması gerekir.
                          tag: "assets/modelgrid1.jpeg",
                          child: Container(
                            height: 200,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage("assets/modelgrid1.jpeg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detay(
                                            img: "assets/modelgrid2.jpeg",
                                          )));
                            },
                            child: Hero(
                              tag: "assets/modelgrid2.jpeg",
                              child: Container(
                                height: 95,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/modelgrid2.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detay(
                                            img: "assets/modelgrid3.jpeg",
                                          )));
                            }),
                            child: Hero(
                              tag: "assets/modelgrid3.jpeg",
                              child: Container(
                                height: 95,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/modelgrid3.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2)),
                        child: const Center(
                          child: Text(
                            "Louis vuitton",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 10,
                                color: Colors.brown),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2)),
                        child: const Center(
                          child: Text(
                            "Chloe",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 10,
                                color: Colors.brown),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.reply,
                        color: Colors.brown.withOpacity(0.2),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("1.7k",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 16)),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.brown.withOpacity(0.2),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("325",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Container(
                          child: Row(children: const [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("2.3k",
                                style: TextStyle(
                                    fontFamily: "Montserrat", fontSize: 16)),
                          ]),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget listeElemanlari(String image, String logo) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Positioned(
              // stack yapsının içerisinde yer alan bir yapıdır. Bu yapı sayesinde üst üste gelen yapıların üzerinde margin vererek pynamamızı sağlar.
              top: 50,
              left: 50,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(logo), fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.brown),
          child: const Center(
            child: Text(
              "Follow",
              style: TextStyle(
                  fontFamily: "Montserrat", fontSize: 14, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
