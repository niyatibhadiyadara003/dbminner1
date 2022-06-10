import 'package:flutter/material.dart';

import 'helpers/quotehelper.dart';
import 'models/quotemodel.dart';

class SeeallPage extends StatefulWidget {
  const SeeallPage({Key? key}) : super(key: key);

  @override
  State<SeeallPage> createState() => _SeeallPageState();
}

class _SeeallPageState extends State<SeeallPage> {
  late Future<List<Quotemodel>> fetchalldata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("See All Category"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                fetchalldata = Quotehelper.quotehelper.fetchlovedb();
                Navigator.of(context)
                    .pushNamed('quotepage', arguments: fetchalldata);
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 50,
                        child: Text(
                          "LO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Love Quotes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                fetchalldata = Quotehelper.quotehelper.fetchmodb();
                Navigator.of(context)
                    .pushNamed('quotepage', arguments: fetchalldata);
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 50,
                        child: Text(
                          "MO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Motivational Quotes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                fetchalldata = Quotehelper.quotehelper.fetch();
                Navigator.of(context)
                    .pushNamed('quotepage', arguments: fetchalldata);
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 50,
                        child: Text(
                          "FA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Famous Quotes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                fetchalldata = Quotehelper.quotehelper.fetchmixdb();
                Navigator.of(context)
                    .pushNamed('quotepage', arguments: fetchalldata);
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 50,
                        child: Text(
                          "MI",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Mix Quotes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.indigo,
                      radius: 50,
                      child: Text(
                        "AL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Albert Einstein Quotes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 50,
                      child: Text(
                        "SW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Swami vivekananda Quotes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
