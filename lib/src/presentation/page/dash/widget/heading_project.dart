import 'package:flutter/material.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/page/dash/widget/modal_create.dart';
import 'package:panel_apk/src/presentation/widget/textfield.dart';

import '../../../widget/button.dart';

class WHeadingProject extends StatefulWidget {
  final String token;
  const WHeadingProject({super.key, required this.token});

  @override
  State<WHeadingProject> createState() => _WHeadingProjectState();
}

class _WHeadingProjectState extends State<WHeadingProject> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _projectName = TextEditingController();
  final TextEditingController _packageName = TextEditingController();
  final TextEditingController _godevName = TextEditingController();
  bool isTyping = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Appsize.symetric(horizontal: 12, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 400,
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: AppTextfield(
                      controller: _controller,
                      preffixIcon: const Icon(Icons.search),
                      suffixIcon: isTyping
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              splashRadius: 20,
                              onPressed: () {
                                setState(() {
                                  _controller.clear();
                                  isTyping = false;
                                });
                              },
                            )
                          : null,
                      hintText: 'Cari Project',
                      onChanged: (value) {},
                    ),
                  ),
                ],
              )),
          AppButton(
            widget: const Row(
              children: [
                Icon(Icons.add),
                Text('New Project'),
              ],
            ),
            width: 200,
            height: 50,
            onPressed: () {
              modalCreate(
                context: context,
                formKey: _formKey,
                token: widget.token,
                projectName: _projectName,
                packageName: _packageName,
                godevName: _godevName,
              );
            },
          ),
        ],
      ),
    );
  }
}
