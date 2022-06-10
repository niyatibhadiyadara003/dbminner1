import 'package:dbmanner1/helpers/quotehelper.dart';
import 'package:dbmanner1/models/quotemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

List star = [];

class _QuotePageState extends State<QuotePage> {
  Color checkcolor = Colors.black;
  bool isstar = false;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Quotes"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: args,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Quotemodel> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      List detail = [data[i].author, data[i].quote];

                      Navigator.of(context)
                          .pushNamed('detailedpage', arguments: detail);
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data[i].quote!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        print(data[i].id);
                                        print(i + 1);
                                        if (data[i].id == i + 1) {
                                          checkcolor =
                                              (checkcolor == Colors.black)
                                                  ? Colors.green
                                                  : Colors.black;
                                          if (checkcolor == Colors.black) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      backgroundColor:
                                                          Colors.black,
                                                      content: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Text(
                                                          "Unread",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      backgroundColor:
                                                          Colors.black,
                                                      content: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Text(
                                                          "Mark as Read",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                          }
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.check,
                                      color: checkcolor,
                                    )),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isstar = (isstar == false) ? true : false;

                                      if (isstar == true) {
                                        star.add(data[i].quote);
                                      } else {
                                        star.remove(data[i].quote);
                                      }
                                      Quotemodel.star = star;
                                    });
                                  },
                                  icon: (isstar == true)
                                      ? Icon(Icons.star)
                                      : Icon(Icons.star_border),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Clipboard.setData(ClipboardData(
                                        text: "${data[i].quote}"));

                                    ClipboardData? cdata =
                                        await Clipboard.getData(
                                            Clipboard.kTextPlain);
                                    String? copiedtext = cdata!.text;
                                    print(copiedtext);
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: Colors.black,
                                              content: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                  icon: Icon(Icons.copy),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
