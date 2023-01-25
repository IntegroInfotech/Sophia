import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sophia/api/api_service.dart';
import 'package:sophia/cards/alumni_card.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';
import 'package:sophia/models/Alumni.dart';

class AlumniScreen extends StatelessWidget {
  const AlumniScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const CustomText(
          title: "SOPHIA ALUMNI",
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SophiaAlumni>>(
        future: apiService.fetchAlumni(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sophiaAlumni = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: sophiaAlumni.length,
                crossAxisCount: 1,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return AlumniCard(
                    image: sophiaAlumni[index].image,
                    name: sophiaAlumni[index].name,
                    designation: sophiaAlumni[index].designation,
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
