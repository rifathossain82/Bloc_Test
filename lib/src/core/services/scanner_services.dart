// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// import '../../utils/color.dart';
// import '../../utils/dimensions.dart';
// import '../methods/helper_methods.dart';
// import '../../views/base/k_divider.dart';

// class QRCodeScannerDialog extends StatefulWidget {
//   const QRCodeScannerDialog({super.key});

//   @override
//   QRCodeScannerDialogState createState() => QRCodeScannerDialogState();
// }

// class QRCodeScannerDialogState extends State<QRCodeScannerDialog> {
//   // Define variables for the QR code scanner
//   QRViewController? _controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   bool _flashOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(
//                   Icons.close,
//                   color: kRed,
//                 ),
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: (){
//                   setState(() {
//                     _flashOn = !_flashOn;
//                   });
//                   _controller!.toggleFlash();
//                 },
//                 child: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: mainColor,
//                     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                   ),
//                   child: Icon(Icons.flash_on_outlined, color: kWhite),
//                 ),
//               ),
//               addHorizontalSpace(Dimensions.paddingSizeSmall),
//               GestureDetector(
//                 onTap: (){
//                   setState(() {
//                     _controller!.flipCamera();
//                   });
//                 },
//                 child: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: mainColor,
//                     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                   ),
//                   child: Icon(Icons.cameraswitch, color: kWhite),
//                 ),
//               ),
//               addHorizontalSpace(Dimensions.paddingSizeSmall),
//             ],
//           ),

//           const KDivider(),

//           // Create a container for the QR code scanner
//           SizedBox(
//             height: 280,
//             width: 280,
//             child: QRView(
//               key: qrKey,
//               cameraFacing: CameraFacing.back,
//               onQRViewCreated: _onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                 borderColor: kDeepOrange,
//                 borderRadius: 10,
//                 borderLength: 30,
//                 borderWidth: 10,
//                 cutOutSize: 300,
//               ),
//             ),
//           ),

//           addVerticalSpace(Dimensions.paddingSizeDefault),
//         ],
//       ),
//     );
//   }

//   // Define the function to handle the QR code scanner
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       Navigator.of(context).pop(scanData.code);
//       controller.dispose();
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
