import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';
import 'package:sophia/screens/open_url.dart';

class NoticeCard extends StatelessWidget {
  final String msg;
  final String webLink;

  const NoticeCard(
      {super.key, required this.msg,
      required this.webLink});

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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CustomText(
                                title: msg,
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
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: webLink,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openUrl(context, url: webLink, color: Constants.primaryColor),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
