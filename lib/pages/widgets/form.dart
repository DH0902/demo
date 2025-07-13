import 'package:flutter/material.dart';

class CommonForm extends StatefulWidget {
  final String id;

  const CommonForm({super.key, required this.id});

  @override
  State<CommonForm> createState() => _CommonFormState();
}

class _CommonFormState extends State<CommonForm> {
  bool checkBox1 = false;
  bool checkBox2 = false;

  void _onToggleCheckBox1(bool? value) {
    if (value == null) return;
    setState(() {
      checkBox1 = value;
    });
  }

  void _onToggleCheckBox2(bool? value) {
    if (value == null) return;
    setState(() {
      checkBox2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeldFormField(
          label: 'ID',
          enabled: false,
          hint: widget.id,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: LabeldFormField(
                label: 'First Name',
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: LabeldFormField(
                label: 'Last Name',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        LabeldFormField(label: 'Email'),
        const SizedBox(height: 20),
        LabeldFormField(label: 'Phone'),
        const SizedBox(height: 20),
        LabeldFormField(label: 'IC Number'),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
                value: checkBox1,
                onChanged: (value) => _onToggleCheckBox1(value)),
            Text('Customer agreed to receive marketing emails.'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
                value: checkBox2,
                onChanged: (value) => _onToggleCheckBox2(value)),
            Text('Customer agreed to receive marketing text messages.'),
          ],
        ),
      ],
    );
  }
}

class LabeldFormField extends StatelessWidget {
  final double? width;
  final String label;
  final bool enabled;
  final String? hint;

  const LabeldFormField({
    super.key,
    required this.label,
    this.width,
    this.enabled = true,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(label: label),
        const SizedBox(height: 5),
        SizedBox(
          width: width,
          child: FormTextFormField(
            hint: hint,
            isEnable: enabled,
          ),
        ),
      ],
    );
  }
}

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}

class FormTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool isEnable;

  const FormTextFormField({
    super.key,
    this.hint,
    this.controller,
    required this.isEnable,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 10.0,
        ),
      ),
      controller: controller,
    );
  }
}
