import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/phrase/phrase_controller.dart';
import 'package:transcribing2/app/modules/upload/upload_widget.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:transcribing2/app/widget/input_description.dart';
import 'package:transcribing2/app/widget/input_title.dart';
import 'package:transcribing2/app/widget/required_id.dart';

class PhraseAddEdit extends StatefulWidget {
  PhraseController controller = Get.find<PhraseController>();

  PhraseAddEdit({
    Key? key,
  }) : super(key: key);

  @override
  _PhraseAddEditState createState() => _PhraseAddEditState();
}

class _PhraseAddEditState extends State<PhraseAddEdit> {
  // late PhraseController controller;

  // // _PhraseAddEditState();
  // @override
  // void initState() {
  //   super.initState();
  //   controller = widget.phraseController;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.controller.addOrEdit ? "Add" : "Edit"} sentence.'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: widget.controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    '${widget.controller.model.teacher.id}/${widget.controller.model.id}'),
                InputTitle(
                  label: 'Group for this sentence',
                  required: true,
                  initialValue: widget.controller.model.group,
                  validator: widget.controller.formValidateRequiredText,
                  onChanged: (value) {
                    widget.controller.formOnChangeField(group: value);
                  },
                ),
                InputDescription(
                  label: 'Input the sentence. One word or symbol by line',
                  required: true,
                  initialValue: widget.controller.model.phraseList.join('\n'),
                  validator: widget.controller.formValidateRequiredText,
                  onChanged: (value) {
                    widget.controller.formOnChangeField(phrase: value);
                  },
                ),
                // UploadWidget(
                //   label: 'Send the audio',
                //   requiredField: true,
                //   pathInFirestore:
                //       '${widget.controller.model.teacher.id}/${widget.controller.model.id}',
                //   setStateWidget: () {
                //     print('setState in phraseAddEdit');
                //     setState(() {});
                //   },
                // ),
                RequiredId(
                  message: 'Sentence id: ${widget.controller.model.id}',
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save this data in cloud',
        child: const Icon(AppIconData.saveInCloud),
        onPressed: () {
          widget.controller.formSubmit();
        },
      ),
    );
  }
}
