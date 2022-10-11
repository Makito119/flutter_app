import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shot_dev/model/homepage_data.dart';
import 'package:flutter_shot_dev/view/shot/scancode.dart';
import 'package:flutter_shot_dev/widgets/shot_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../view_model/hoempage_notifier.dart';

class ShotPage extends HookConsumerWidget {
  const ShotPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageData homePageData = ref.watch(homepageProvider);
    final ScrollController scrollController =
        ScrollController(keepScrollOffset: false);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        ref.read(homepageProvider.notifier).showNav();
      } else {
        ref.read(homepageProvider.notifier).hideNav();
      }
    });

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff48366d), Color(0xff2c2339)],
      )),
      child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRViewExample()));
                          },
                          child: ShotWidgets.codeScanBar(context: context)),
                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff48366d), Color(0xff2c2339)],
                        )),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.5,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment(0, 0),
                                      child: Opacity(
                                          opacity: 0.24,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.95,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x7f840899),
                                                  blurRadius: 35,
                                                  offset: Offset(0, 8),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                          ))),
                                  Align(
                                    alignment: Alignment(0, -0.8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff9e6efd),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment(0, 1),
                                      child: Opacity(
                                        opacity: 0.24,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.95,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.23,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x7f840899),
                                                blurRadius: 35,
                                                offset: Offset(0, 8),
                                              ),
                                            ],
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
