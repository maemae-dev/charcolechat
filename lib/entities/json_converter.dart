import 'package:cloud_firestore/cloud_firestore.dart';

Timestamp? toTimestamp(DateTime? date) =>
    date != null ? Timestamp.fromDate(date) : null;

DateTime? toDateTime(Timestamp? timestamp) => timestamp?.toDate();
