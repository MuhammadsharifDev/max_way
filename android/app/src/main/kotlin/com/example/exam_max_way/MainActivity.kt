package com.example.exam_max_way

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("ec4429c0-7c77-4488-9bbd-d21af99d29ea") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
