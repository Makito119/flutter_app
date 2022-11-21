import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view/constant/privacy_policy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/tos_widgets.dart';

class TosPage extends HookConsumerWidget {
  const TosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff2c233a),
          title: const Text('利用規約'),
          shadowColor: const Color(0x7f840899),
          elevation: 10,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    '利用規約',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'この利用規約（以下，「本規約」といいます。）は，＿＿＿＿＿（以下，「当社」といいます。）がこのウェブサイト上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: PRIVACY_POLICY.length,
                    itemBuilder: (BuildContext context, index) {
                      String key = PRIVACY_POLICY.keys.elementAt(index);
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TosWidget.titleBar(
                              context: context,
                              title: key,
                            ),
                            TosWidget.oneitemBar(
                              context: context,
                              text: '${PRIVACY_POLICY[key]}',
                            )
                          ]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
