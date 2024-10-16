import 'package:cloud_firestore/cloud_firestore.dart';

class SignalingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new call document in Firestore
  Future<void> createCall(String callerId, String receiverId) async {
    await _firestore.collection('calls').add({
      'callerId': callerId,
      'receiverId': receiverId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Listen for incoming call offers or answers
  Stream<DocumentSnapshot> onCallOffer(String callId) {
    return _firestore.collection('calls').doc(callId).snapshots();
  }
}
