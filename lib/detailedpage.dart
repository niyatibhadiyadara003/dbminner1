import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dbmanner1/quotepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'models/quotemodel.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  bool isstar = false;
  List images = [
    'assets/images/w1.jpg',
    'assets/images/w2.jpg',
    'assets/images/w3.jpg',
    'assets/images/w4.jpg',
    'assets/images/w5.jpg',
  ];

  List<String> textstyle = [
    "Louie_'s Font",
    "Lets Eat",
    "Khand",
    "Blackza",
    "Barnie's",
  ];
  Random r1 = Random();
  int text = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(images[index]),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Text(
                "${args[1]}",
                style: TextStyle(
                    fontFamily: textstyle[text],
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(" - ${args[0]}",
                style: TextStyle(
                  fontFamily: textstyle[text],
                  fontSize: 20,
                  color: Colors.white,
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      index = r1.nextInt(images.length);
                    });
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      text = r1.nextInt(textstyle.length);
                    });
                  },
                  icon: const Icon(
                    Icons.text_format,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Share.share(
                      'Hello, check your share files!',
                      subject: 'URL File Share',
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Clipboard.setData(ClipboardData(text: "${args[1]}"));

                    ClipboardData? cdata =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    String? copiedtext = cdata!.text;
                    print(copiedtext);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.black,
                              content: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Copied text: $copiedtext",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ));
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isstar = (isstar == false) ? true : false;

                      if (isstar == true) {
                        star.add(args[1]);
                      } else {
                        star.remove(args[1]);
                      }
                      Quotemodel.star = star;
                    });
                  },
                  icon: (isstar == true)
                      ? Icon(
                          Icons.star,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.star_border,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
