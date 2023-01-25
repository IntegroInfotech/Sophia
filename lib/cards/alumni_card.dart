import 'package:flutter/material.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';

class AlumniCard extends StatelessWidget {
  final String image;
  final String name;
  final String designation;

  const AlumniCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.designation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Constants.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex:1,
                        child: SizedBox(
                          height: double.infinity,
                          child: CircleAvatar(
                            radius:50.0,
                            backgroundImage: NetworkImage(image),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: CustomText(
                                      title: name,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: Constants.primaryColor,
                                ),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      designation,
                                      maxLines: 4,
                                      style: const TextStyle(
                                        color: Constants.primaryColorBlue,
                                        fontFamily: Constants.fontTitle,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
