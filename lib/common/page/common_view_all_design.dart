import 'package:demo/extensions/context_extension.dart';
import 'package:demo/helper/file_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonViewAllDesign extends StatefulWidget {
  final double? height;
  final double? width;
  final String pageTitle;
  final Function? createNewFunction;
  final Widget? child;

  const CommonViewAllDesign({
    super.key,
    this.height,
    this.width,
    this.createNewFunction,
    required this.pageTitle,
    this.child,
  });

  @override
  State<CommonViewAllDesign> createState() => _CommonViewAllDesignState();
}

class _CommonViewAllDesignState extends State<CommonViewAllDesign> {
  Widget getIcons() {
    final imgPath = widget.pageTitle == 'Staffs'
        ? 'assets/icons/employee_icon.svg'
        : 'assets/icons/customer_icon.svg';
    return SvgPicture.asset(imgPath, width: 16, height: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  getIcons(),
                  const SizedBox(width: 10),
                  Text(widget.pageTitle)
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    child: Text('Export'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      onPressed: () {
                        FileHelper.showImportDialog(context, widget.pageTitle);
                      },
                      child: Text('Import')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (widget.createNewFunction == null) return;
                        widget.createNewFunction!();
                      },
                      child: Text(
                          'Create ${widget.pageTitle.substring(0, widget.pageTitle.length - 1)}')),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: widget.child!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
