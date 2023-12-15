import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class SectionSelection extends StatefulWidget {
  const SectionSelection({super.key});

  @override
  State<SectionSelection> createState() => _SectionSelectionState();
}

class _SectionSelectionState extends State<SectionSelection> {
  int selectedOptionIndex = 0;

  List<String> options = ['Order', 'Refund'];

  void updateSelectedOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Selection Section"),
      ),
      body: Column(
        children: [
          // Selectable Options
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  updateSelectedOption(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            options[index],
                            style: TextStyle(
                              color: selectedOptionIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 2.5,
                          width: double.maxFinite,
                          child: Container(
                            color: selectedOptionIndex == index
                                ? Colors.red
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Displayed Section
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                color: Colors.grey.shade200,
                child: Center(
                  child: getCurrentSection()
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCurrentSection(){
    switch (selectedOptionIndex) {
      case 0:
        return orderSection();
      case 1:
        return refundSection();
      default:
        return const Placeholder();
    }
  }

  Widget orderSection(){
    return const Text(
      'This is Order Section',
      style: TextStyle(fontSize: 24),
    );
  }
  Widget refundSection(){
    return const Text(
      'This is Refund Section',
      style: TextStyle(fontSize: 24),
    );
  }
  

}