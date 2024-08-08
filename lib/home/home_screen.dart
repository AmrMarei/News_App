import 'package:flutter/material.dart';
import 'package:new_app/api/api_manager.dart';
import 'package:new_app/app_colors.dart';
import 'package:new_app/home/tabs/tabs_widget.dart';
import 'package:new_app/model/SourceResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routNme='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/image/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text('Something went Wrong'),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getSources();
                          },
                          child: Text('Try Again'))
                    ],
                  );
                }
                if (snapshot.data!.status != 'ok') {
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getSources();
                            setState(() {});
                          },
                          child: Text('Try Again'))
                    ],
                  );
                }
                var sourcesList = snapshot.data!.sources!;
                return TabsWidget(sourcesList: sourcesList);
              }),
        ),
      ],
    );
  }
}
