import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage(
      {Key? key, required this.title, required this.descp, required this.image})
      : super(key: key);
  final String title;
  final String descp;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 800,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                  top: -248,
                  left: -103,
                  child: Container(
                      width: 1030,
                      height: 1086,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(99, 24, 175, 0.9599999785423279),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(1030, 1086)),
                      ))),
              Positioned(
                top: -286,
                left: -103,
                child: Container(
                  width: 1030,
                  height: 1086,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(114, 29, 29, 0.4000000059604645),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(1030, 1086)),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child:
                                    image != null ? image! : const SizedBox(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Text(
                                  descp.toString(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  iconSize: 50,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
