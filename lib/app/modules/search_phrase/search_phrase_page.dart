import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/search_phrase/search_phrase_controller.dart';
import 'package:transcribing2/app/modules/search_team/search_team_controller.dart';

class SearchPhrasePage extends GetView<SearchPhraseController> {
  // final IList<PhraseModel> phraseIList;
  // final Function(String) onSetPhrase;

  const SearchPhrasePage({
    Key? key,
    // required this.phraseIList,
    // required this.onSetPhrase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('You have ${controller.list.length} phrases.')),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: buildItens(context),
        ),
      ),
    );
  }

  Widget buildItens(context) {
    return Obx(() {
      if (controller.list.isNotEmpty) {
        List<Widget> list = [];

        for (var model in controller.list) {
          list.add(
            ListTile(
              title: Text(model.phraseList.join(' ')),
              subtitle: Text(model.group),
              onTap: () {
                controller.setPhrase(model);
              },
            ),
            //   Container(
            //   key: ValueKey(model),
            //   child: TeamCard(
            //     team: model,
            //     widgetList: [
            //       IconButton(
            //         tooltip: 'Select this team.',
            //         icon: const Icon(AppIconData.select),
            //         onPressed: () {
            //           controller.setTeam(model);
            //         },
            //       ),
            //     ],
            //   ),
            // )
          );
        }
        return Column(
          children: list,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
