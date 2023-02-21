
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils.dart';

import '../providers/scan_list_provider.dart';
class ScanTitles extends StatelessWidget {
  
      final String tipo;

  const ScanTitles({ required this.tipo });

      
  @override
  Widget build(BuildContext context) {
    final scanListProvider =   Provider.of<ScanListProvider>(context);
      final scans = scanListProvider.scans;

    return  ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _ , i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red 
          ),
          onDismissed: (DismissDirection direction){
            Provider.of<ScanListProvider>(context, listen: false)
            .borrarScaPorId( scans[i].id!);
          },

        child: ListTile(
          leading:  Icon(
            this.tipo == 'http'
             ? Icons.compass_calibration 
             : Icons.map_outlined,
             color: Theme.of(context).primaryColor),
          
          
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => launchUrl(context, scans[i]),
        ),
      ),


      );
  }
}