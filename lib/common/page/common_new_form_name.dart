import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/widgets/form.dart';
import 'package:flutter/material.dart';

class CommonNewFormName extends StatefulWidget {
  final String title;
  final String id;
  final dynamic data;
  final bool isEditable;

  const CommonNewFormName({
    super.key,
    required this.title,
    required this.id,
    this.data,
    this.isEditable = true,
  });

  @override
  State<CommonNewFormName> createState() => _CommonNewFormNameState();
}

class _CommonNewFormNameState extends State<CommonNewFormName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPaddedWidget(
            Text(
              '${widget.title} Overview',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          _buildPaddedWidget(
            CommonForm(
              id: widget.id,
              isEditable: widget.isEditable,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.grey[300],
            ),
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: context.screenWidth,
            height: context.screenHeight * 0.1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'You should ask your customers for permission before you subscribe them to your marketing emails or SMS.'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaddedWidget(Widget child) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: child);
  }
}
