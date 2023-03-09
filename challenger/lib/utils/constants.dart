import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

const BASE_URL = "http://quizzbee.bisubilar.org/api";
FirebaseFirestore db = FirebaseFirestore.instance;

final participantRef = db.collection('paticipants');