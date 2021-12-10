import 'package:flutter/material.dart';

class PhraseList extends StatelessWidget {
  final IList<PhraseModel> phraseIList;
  final Function(String) onArchive;

  const PhraseList({
    Key? key,
    required this.phraseIList,
    required this.onArchive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My sentences'),
        actions: [
          IconButton(
            tooltip: 'Archived sentences',
            icon: const Icon(AppIconData.box),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/phrase_archived',
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: buildItens(context),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new sentence.',
        child: const Icon(AppIconData.addInCloud),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/phrase_addOrEdit',
            arguments: ArgumentsRoutes(['add', '']),
          );
        },
      ),
    );
  }

  List<Widget> buildItens(context) {
    List<Widget> list = [];

    for (var phrase in phraseIList) {
      list.add(Container(
        key: ValueKey(phrase),
        child: PhraseCard(
          phrase: phrase,
          widgetList: [
            IconButton(
              tooltip: 'Edit this sentence.',
              icon: const Icon(AppIconData.edit),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/phrase_addOrEdit',
                  arguments: ArgumentsRoutes(['edit', phrase.id]),
                );
              },
            ),
            IconButton(
              tooltip: 'Archive this sentence',
              icon: const Icon(AppIconData.inbox),
              onPressed: () {
                onArchive(phrase.id);
              },
            ),
            IconButton(
              tooltip: 'Copy this sentence with...',
              icon: const Icon(AppIconData.clone),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/phrase_addOrEdit',
                  arguments: ArgumentsRoutes(['add', phrase.id]),
                );
              },
            ),
          ],
        ),
      ));
    }
    if (list.isEmpty) {
      list.add(const ListTile(
        leading: Icon(AppIconData.smile),
        title: Text("Ops. You don't have any sentence."),
      ));
    }
    return list;
  }
}
