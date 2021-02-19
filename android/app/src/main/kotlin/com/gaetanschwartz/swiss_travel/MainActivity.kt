package com.gaetanschwartz.swiss_travel

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val _CHANNEL = "com.gaetanschwartz.swift_travel.deeplink/channel"
    private var startString: String? = null

    private val _EVENTS = "com.gaetanschwartz.swift_travel.deeplink/events"
    private var linksReceiver: BroadcastReceiver? = null


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor, _CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "initialLink") {
                result.success(startString)
            }
        }
        EventChannel(flutterEngine.dartExecutor, _EVENTS).setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(args: Any?, events: EventChannel.EventSink) {
                        linksReceiver = createChangeReceiver(events)
                    }

                    override fun onCancel(args: Any?) {
                        linksReceiver = null
                    }
                }
        )
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        startString = intent.data?.toString()
        print("We have a startString of $startString")
    }


    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.action === Intent.ACTION_VIEW) {
            linksReceiver?.onReceive(this.applicationContext, intent)
        }
    }


    fun createChangeReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                if (intent.action == Intent.ACTION_VIEW) {
                    val dataString: String? = intent.dataString
                    print("We got a redirectLink of $dataString")
                    if (dataString == null)
                        events.error("UNAVAILABLE", "Link unavailable", null)
                    else
                        events.success(dataString)
                }
            }
        }
    }
}
