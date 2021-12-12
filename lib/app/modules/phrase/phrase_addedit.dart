import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/phrase/phrase_controller.dart';
import 'package:transcribing2/app/modules/upload/upload_widget.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:transcribing2/app/widget/input_description.dart';
import 'package:transcribing2/app/widget/input_title.dart';
import 'package:transcribing2/app/widget/required_id.dart';

class PhraseAddEdit extends GetView<PhraseController> {
// class PhraseAddEdit extends StatefulWidget {
//   PhraseController controller = Get.find<PhraseController>();

//   PhraseAddEdit({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _PhraseAddEditState createState() => _PhraseAddEditState();
// }

// class _PhraseAddEditState extends State<PhraseAddEdit> {
//   // late PhraseController controller;

//   // // _PhraseAddEditState();
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   controller = phraseController;
//   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.addOrEdit ? "Add" : "Edit"} sentence.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${controller.model.teacher.id}/${controller.model.id}'),
                  InputTitle(
                    label: 'Group for this sentence',
                    required: true,
                    initialValue: controller.model.group,
                    validator: controller.formValidateRequiredText,
                    onChanged: (value) {
                      controller.formOnChangeField(group: value);
                    },
                  ),
                  InputDescription(
                    label: 'Input the sentence. One word or symbol by line',
                    required: true,
                    initialValue: controller.model.phraseList.join('\n'),
                    validator: controller.formValidateRequiredText,
                    onChanged: (value) {
                      controller.formOnChangeField(phrase: value);
                    },
                  ),
                  // UploadWidget(
                  //   label: 'Send the audio',
                  //   requiredField: true,
                  //   pathInFirestore:
                  //       '${controller.model.teacher.id}/${controller.model.id}',
                  //   setStateWidget: () {
                  //     print('setState in phraseAddEdit');
                  //     setState(() {});
                  //   },
                  // ),
                ],
              ),
            ),
            // Obx(() {
            //   return UploadWidget(
            //     label: 'Send the audio',
            //     requiredField: true,
            //     pathInFirestore:
            //         '${controller.model.teacher.id}/${controller.model.id}',
            //     setStateWidget: () {
            //       print('setState in phraseAddEdit');
            //       // setState(() {});
            //     },
            //   );
            // }),
            UploadWidget(
              label: 'Send the audio',
              requiredField: true,
              pathInFirestore:
                  '${controller.model.teacher.id}/${controller.model.id}',
              getUrl: (url) {
                print('setState in phraseAddEdit');
                controller.formOnChangeField(phraseAudio: url);
                // setState(() {});
              },
            ),
            Obx(() {
              return Text('${controller.model.phraseAudio}');
            }),
            RequiredId(
              message: 'Sentence id: ${controller.model.id}',
            ),
          ],
        ),
        /*
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '${controller.model.teacher.id}/${controller.model.id}'),
              InputTitle(
                label: 'Group for this sentence',
                required: true,
                initialValue: controller.model.group,
                validator: controller.formValidateRequiredText,
                onChanged: (value) {
                  controller.formOnChangeField(group: value);
                },
              ),
              InputDescription(
                label: 'Input the sentence. One word or symbol by line',
                required: true,
                initialValue: controller.model.phraseList.join('\n'),
                validator: controller.formValidateRequiredText,
                onChanged: (value) {
                  controller.formOnChangeField(phrase: value);
                },
              ),
              // UploadWidget(
              //   label: 'Send the audio',
              //   requiredField: true,
              //   pathInFirestore:
              //       '${controller.model.teacher.id}/${controller.model.id}',
              //   setStateWidget: () {
              //     print('setState in phraseAddEdit');
              //     setState(() {});
              //   },
              // ),
              RequiredId(
                message: 'Sentence id: ${controller.model.id}',
              ),
            ],
          ),
        ),
        */
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save this data in cloud',
        child: const Icon(AppIconData.saveInCloud),
        onPressed: () {
          controller.formSubmit();
        },
      ),
    );
  }
}
