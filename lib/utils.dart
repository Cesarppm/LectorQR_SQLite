import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'models/scan_model.dart';


Future launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if(scan.tipo == 'http'){
   //Abrir el sitio web
     if (!await launchUrlString(url)) {
          throw 'Could not launch $url';    
    } 
 
  }  else{
      Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
 
}