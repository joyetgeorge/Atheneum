import 'package:Atheneum/Screens/InfoPage.dart';
import 'package:flutter/material.dart';

class Latest extends StatelessWidget {
  const Latest({
    Key? key,
    required this.docs,
  }) : super(key: key);

  final List docs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 210,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final data = docs[index].data() as Map;

                  return Container(
                    width: 140,
                    height: 100,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => InfoPage(
                                        data: data,
                                      ))),
                          child: Hero(
                            tag: data,
                            child: Image.network(
                                "https://covers.openlibrary.org/b/isbn/" +
                                    data['isbn'] +
                                    "-M.jpg"),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

