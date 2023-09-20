import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtemp/utils/color.dart';
import 'package:riverpodtemp/utils/common_components/common_listview.dart';
import 'package:riverpodtemp/utils/common_components/common_text.dart';

import '../error/error_screen.dart';
import '../loading/loading_screen.dart';
import 'dummy_data_screen_controller.dart';

class MyHomePage extends ConsumerStatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(myHomePageControllerProvider);
    controller() => ref.read(myHomePageControllerProvider.notifier);

    return Theme(
      data: Theme.of(context),
      child: asyncState.when(
        data: (state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: state.dummyDataModel == null
                  ? const CommonLoadingScreen()
                  : Center(
                      child: CommonListView(
                          itemCount: state.dummyDataModel!.articles!.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: false,
                          padding: EdgeInsets.zero,
                          width: w,
                          height: h,
                          itemBuilder: (context, index) {
                            return Container(
                              width: w * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "${index + 1}.  ",
                                    style: ptSansTextStyle(
                                      color: AppColors.black,
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: w * 0.88,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CommonText(
                                                text: state
                                                        .dummyDataModel!
                                                        .articles![index]
                                                        .author ??
                                                    "--",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: w * 0.88,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CommonText(
                                                text: state
                                                        .dummyDataModel!
                                                        .articles![index]
                                                        .title ??
                                                    "--",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                      // This trailing comma makes auto-formatting nicer for build methods.
                    ));
        },
        error: (error, stackTrace) {
          return const ErrorScreen(
            text: "Error",
            backgroundColor: AppColors.black,
            color: AppColors.black,
          );
        },
        loading: () {
          return const CommonLoadingScreen();
        },
      ),
    );
  }
}
