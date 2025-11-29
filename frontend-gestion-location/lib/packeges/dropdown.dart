// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// // ignore: must_be_immutable
// class AppTextField extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final String title;
//   final String hint;
//   final bool isCitySelected;
//   final List<SelectedListItem>? cities;
//   late List list = [];
//   final bool MultileSelection;

//   AppTextField({
//     required this.textEditingController,
//     required this.title,
//     required this.hint,
//     required this.isCitySelected,
//     this.cities,
//     required this.MultileSelection,
//     super.key, 
//   });

//   @override
//   State<AppTextField> createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   /// This is on text changed method which will display on city text field on changed.
//   void onTextFieldTap() {
//     DropDownState(
//       DropDown(
        
//         isDismissible: true,
//         bottomSheetTitle: Text(
//           widget.hint,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         maxSelectedItems: 3,
//         clearButtonChild: const Text(
//           'Clear',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data: widget.cities ?? [],
//         onSelected: (List<dynamic> selectedList) {
//           // List<String> list = [];
//           for (var item in selectedList) {
//             if (item is SelectedListItem) {
//               widget.list.add(item.name);
//             }
//           }
//           showSnackBar(widget.list.toString());
//         },
//         enableMultipleSelection: widget.MultileSelection,
//       ),
//     ).showModal(context);
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
        
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Text(widget.title),
//         // const SizedBox(
//         //   height: 5.0,
//         // ),
//         const SizedBox(
//           height: 15.0,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: TextFormField(
//             controller: widget.textEditingController,
//             readOnly: true,
//             onTap: widget.isCitySelected
//                 ? () {
//                     FocusScope.of(context).unfocus();
//                     onTextFieldTap();
//                   }
//                 : null,
//             decoration: InputDecoration(
//               // filled: true,
//               // fillColor: Colors.black12,
//               suffixIcon: Icon(
//                 Icons.arrow_drop_down,
//                 color: Colors.black,
//               ),
//               contentPadding:
//                   const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//               hintText: widget.hint,
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   style: BorderStyle.none,
//                 ),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }