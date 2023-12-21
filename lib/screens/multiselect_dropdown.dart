import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class MultiSelectDropdownField extends StatefulWidget {
  final List<String> options;

  const MultiSelectDropdownField({
    required this.options,
    super.key
  });

  @override
  State<MultiSelectDropdownField>  createState() =>
      _MultiSelectDropdownFieldState();
}

class _MultiSelectDropdownFieldState extends State<MultiSelectDropdownField> {
  List<String> selectedOptions = [];
  final MultiSelectController _controller = MultiSelectController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Scroolable Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: MultiSelectDropDown(
            showClearIcon: true,
            controller: _controller,
            onOptionSelected: (options) {
              debugPrint(options.toString());
            },
            options: <ValueItem>[
              for(String item in widget.options)
                createOption(item, item)
            ],
            maxItems: 5,
            // disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
            searchEnabled: true,
            selectedOptionBackgroundColor: Colors.white,
            // hintColor: Colors.transparent,
            
          ),
        ),
      ),
    );
  }

  ValueItem createOption(String label, String value){
    return ValueItem(label: label, value: value);
  }
}
