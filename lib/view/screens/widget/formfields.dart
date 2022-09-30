// class CustomFormField extends StatelessWidget {
//   final String Function(String?) validator;
//   final TextEditingController controller;
//   final bool obscureText;
//   final TextInputType keyboardType;

//   final double fontSize;
//   final int maxLines;
//   final Color color;
//   final String hintText;

//   final IconData icon;
//   const CustomFormField({
//     Key? key,
//     required this.icon,
//     required this.validator,
//     required this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.name,
//     this.fontSize = 18,
//     this.maxLines = 1,
//     this.color = Colors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       style: TextStyle(
//           fontSize: fontSize,
//           overflow: TextOverflow.ellipsis,
//           color: color,
//           fontWeight: FontWeight.normal),
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           icon,
//           color: Colors.white,
//           size: 24,
//         ),
//         hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
//         hintText: hintText,
//         errorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.red, width: 3),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.green, width: 3),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white, width: 3),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white, width: 3),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       maxLines: maxLines,
//     );
//   }
// }
