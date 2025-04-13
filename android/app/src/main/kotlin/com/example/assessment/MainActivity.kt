package com.example.assessment

import NotificationApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        NotificationApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            NotificationApiImpl(this)
        )
    }
}
