import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../services/webrtc_service.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final WebRTCService _webRTCService = WebRTCService();

  @override
  void initState() {
    super.initState();
    _initializeWebRTC();
  }

  Future<void> _initializeWebRTC() async {
    await _webRTCService.initializeWebRTC();
    setState(() {}); // Rebuild the UI after initialization is complete
  }

  @override
  Widget build(BuildContext context) {
    final localRenderer = _webRTCService.getLocalRenderer();
    final remoteRenderer = _webRTCService.getRemoteRenderer();

    return Scaffold(
      appBar: AppBar(title: const Text("Video Call")),
      body: Column(
        children: [
          Expanded(
            child: localRenderer.srcObject != null
                ? RTCVideoView(localRenderer)
                : const Center(child: Text("Local stream not available")),
          ),
          Expanded(
            child: remoteRenderer.srcObject != null
                ? RTCVideoView(remoteRenderer)
                : const Center(child: Text("Remote stream not available")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _webRTCService.hangUp();
          Navigator.pop(context);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.call_end),
      ),
    );
  }

  @override
  void dispose() {
    _webRTCService.hangUp();
    super.dispose();
  }
}
