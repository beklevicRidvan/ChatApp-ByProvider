import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin ConstantsMethod on StatelessWidget{

  String formatTimestamp(Timestamp timestamp) {
    // Timestamp'i DateTime nesnesine dönüştür
    DateTime dateTime = DateTime.timestamp();

    // Belirli bir biçimde tarih ve saat yazdır
    String formattedDateTime = DateFormat('HH:mm').format(dateTime);

    return formattedDateTime;
  }

}