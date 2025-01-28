//
// void  showUnauthorizedPopup(
//       {
//         required IconData icon,
//         required Color iconColor,
//         required String message,
//         required String buttonText,
//         required bool barrierDismissible,
//         dynamic popParameter,
//         required Function(bool shouldRoute) onChanged}) {
//     showDialog(
//       context: context,
//       barrierDismissible: barrierDismissible,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Icon(
//                 icon,
//                 color: Theme.of(context).colorScheme.primary,
//                 size: 60,
//               ),
//               const SizedBox(height: 15),
//               CommonText(
//                 text: message,
//                 textAlign: TextAlign.center,
//                 style: AppTypography.subtitle1
//                     .copyWith(color: Theme.of(context).colorScheme.primary),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                   height: 40.h,
//                   width: 80.w,
//                   child: CommonElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context, popParameter);
//                       onChanged(true);
//                     },
//                     text: 'Ok',
//                     backgroundColor: Theme.of(context).colorScheme.primary,
//                     textStyle: AppTypography.subtitle2.copyWith(
//                         color: Theme.of(context).colorScheme.onPrimary),
//                   ))
//             ],
//           ),
//         );
//       },
//     );
//   }
//
