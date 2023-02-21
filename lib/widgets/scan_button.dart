

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils.dart';

class ScanButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async
      {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
            
            if(barcodeScanRes == '-1'){
              return;
            }

          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          

          scanListProvider.nuevoScan(barcodeScanRes);
            final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchUrl(context, nuevoScan);
          
      }
    );
      
  }
}