import 'package:demo/extensions/context_extension.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        height: widget.height ?? context.screenHeight * 0.6,
        width: widget.width ?? context.screenWidth * 0.6,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pageTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Export')),
                    const SizedBox(width: 20),
                    ElevatedButton(onPressed: () {}, child: Text('Import')),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
            if (widget.child != null) widget.child!
          ],
        ),
      ),
    );
  }
}
