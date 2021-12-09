import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/theme/app_icon.dart';

import 'team_card.dart';
import 'team_controller.dart';

class TeamPage extends GetView<TeamController> {
  const TeamPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('My teams ${controller.teamList.length}')),
      ),
      body: buildItens(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new team.',
        child: const Icon(AppIconData.addInCloud),
        onPressed: () {
          controller.add();
        },
      ),
    );
  }

  Widget buildItens(context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.teamList.length,
        itemBuilder: (context, index) {
          TeamModel teamModel = controller.teamList[index];
          return Container(
            key: ValueKey(teamModel),
            child: TeamCard(
              team: teamModel,
              widgetList: [
                IconButton(
                  tooltip: 'Edit this team.',
                  icon: const Icon(AppIconData.edit),
                  onPressed: () {
                    controller.edit(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
