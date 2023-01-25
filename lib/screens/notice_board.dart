import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sophia/api/api_service.dart';
import 'package:sophia/cards/notice_card.dart';
import 'package:sophia/cards/notification_card.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';
import 'package:sophia/models/notice_board.dart';

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const CustomText(
          title: "SOPHIA NOTICE BOARD",
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SophiaNotice>>(
        future: apiService.fetchNotice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sophiaNotice = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: sophiaNotice.length,
                crossAxisCount: 1,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return NoticeCard(
                    msg: sophiaNotice[index].msg,
                    webLink: sophiaNotice[index].weblink,
                  );
                },
              );
            }
          } else {
            print(snapshot.connectionState);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
