import 'package:dbmanner1/helpers/quotehelper.dart';
import 'package:dbmanner1/models/quotemodel.dart';
import 'package:dbmanner1/quotepage.dart';
import 'package:dbmanner1/seeallpage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'detailedpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const HomePage(),
      'quotepage': (context) => const QuotePage(),
      'seeallpage': (context) => const SeeallPage(),
      'detailedpage': (context) => const DetailedPage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Quotemodel>> fetchalldata;

  GlobalKey<FormState> insertformkey = GlobalKey();
  TextEditingController authorcontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  TextEditingController quotecontroller = TextEditingController();

  String author = "";
  String quote = "";
  String id = "";

  List images = [
    "assets/images/i1.jpg",
    "assets/images/i2.jpg",
    "assets/images/i3.jpg",
    "assets/images/i4.jpg",
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: Quotemodel.star
                        .map((e) => Card(elevation: 3, child: Text(e)))
                        .toList(),
                  ));
                });
          },
          icon: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
        title: Text("Amazing quotes"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Form(
                                            key: insertformkey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "id",
                                                  ),
                                                  controller: idcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter id first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      id = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Author name",
                                                  ),
                                                  controller: authorcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter author name first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      author = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "quote",
                                                  ),
                                                  controller: quotecontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter quote first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      quote = val!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (insertformkey.currentState!
                                                    .validate()) {
                                                  insertformkey.currentState!
                                                      .save();
                                                  int i = await Quotehelper
                                                      .quotehelper
                                                      .insertdb(
                                                          id: id,
                                                          author: author,
                                                          quote: quote);
                                                }
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Insert"),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancle"),
                                            ),
                                          ],
                                        ));
                              },
                              child: Text("famous"),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Form(
                                            key: insertformkey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "id",
                                                  ),
                                                  controller: idcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter id first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      id = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Author name",
                                                  ),
                                                  controller: authorcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter author name first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      author = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "quote",
                                                  ),
                                                  controller: quotecontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter quote first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      quote = val!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (insertformkey.currentState!
                                                    .validate()) {
                                                  insertformkey.currentState!
                                                      .save();
                                                  int i = await Quotehelper
                                                      .quotehelper
                                                      .insertlovedb(
                                                          id: id,
                                                          author: author,
                                                          quote: quote);
                                                }
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Insert"),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancle"),
                                            ),
                                          ],
                                        ));
                              },
                              child: Text("love"),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Form(
                                            key: insertformkey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "id",
                                                  ),
                                                  controller: idcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter id first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      id = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Author name",
                                                  ),
                                                  controller: authorcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter author name first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      author = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "quote",
                                                  ),
                                                  controller: quotecontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter quote first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      quote = val!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (insertformkey.currentState!
                                                    .validate()) {
                                                  insertformkey.currentState!
                                                      .save();
                                                  int i = await Quotehelper
                                                      .quotehelper
                                                      .insertmixdb(
                                                          id: id,
                                                          author: author,
                                                          quote: quote);
                                                }
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Insert"),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancle"),
                                            ),
                                          ],
                                        ));
                              },
                              child: Text("Mix"),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Form(
                                            key: insertformkey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "id",
                                                  ),
                                                  controller: idcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter id first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      id = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Author name",
                                                  ),
                                                  controller: authorcontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter author name first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      author = val!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "quote",
                                                  ),
                                                  controller: quotecontroller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter quote first...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      quote = val!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (insertformkey.currentState!
                                                    .validate()) {
                                                  insertformkey.currentState!
                                                      .save();
                                                  int i = await Quotehelper
                                                      .quotehelper
                                                      .insertmodb(
                                                          id: id,
                                                          author: author,
                                                          quote: quote);
                                                }
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Insert"),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  id = "";
                                                  author = "";
                                                  quote = "";
                                                  idcontroller.clear();
                                                  authorcontroller.clear();
                                                  quotecontroller.clear();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancle"),
                                            ),
                                          ],
                                        ));
                              },
                              child: Text("Motivational"),
                            ),
                          ],
                        ),
                      ));
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(i),
                          )),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            height: 260,
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        fetchalldata = Quotehelper.quotehelper.fetchlovedb();
                        Navigator.of(context)
                            .pushNamed('quotepage', arguments: fetchalldata);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Love Quotes",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        fetchalldata = Quotehelper.quotehelper.fetch();
                        Navigator.of(context)
                            .pushNamed('quotepage', arguments: fetchalldata);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Famous Quotes",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        fetchalldata = Quotehelper.quotehelper.fetchmodb();
                        Navigator.of(context)
                            .pushNamed('quotepage', arguments: fetchalldata);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Motivational\nQuotes",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Albert Einstein\nQuotes",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 180,
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Quotes By Category",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('seeallpage');
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          fetchalldata = Quotehelper.quotehelper.fetch();
                          Navigator.of(context)
                              .pushNamed('quotepage', arguments: fetchalldata);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Famous Quotes",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          fetchalldata = Quotehelper.quotehelper.fetchmodb();
                          Navigator.of(context)
                              .pushNamed('quotepage', arguments: fetchalldata);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Motivational\nQuotes",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          fetchalldata = Quotehelper.quotehelper.fetchlovedb();
                          Navigator.of(context)
                              .pushNamed('quotepage', arguments: fetchalldata);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Love Quotes",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Albert Einstein\nQuotes",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          fetchalldata = Quotehelper.quotehelper.fetchmixdb();
                          Navigator.of(context)
                              .pushNamed('quotepage', arguments: fetchalldata);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Mix Quotes",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
