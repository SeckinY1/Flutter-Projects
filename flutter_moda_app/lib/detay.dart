import 'package:flutter/material.dart';

class Detay extends StatefulWidget {
  var img;
  Detay({Key? key, this.img}) : super(key: key);

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Hero(
          tag: widget
              .img, // Inkwel bizi bu sayfaya yönlendirdiği için geldiğimiz sayfada bulunan görsel yapısına da aynı işlem uygulanır. Bu nedenle bu widget burada da çağırılır.
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.img), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          bottom: 15,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 4,
            child: Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            image: const DecorationImage(
                                image: AssetImage("assets/dress.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "LAMINATED",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Louis Vuitton",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 180,
                          child: const Text(
                            "One button V-neck sling long-sleeved waist female stitching dress",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 16),
                      child: Text(
                        "\$6500",
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.brown,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        )
      ],
    ));
  }
}
