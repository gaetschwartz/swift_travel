package com.gaetanschwartz.vibration

import android.content.Context
import android.os.Vibrator
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar


class VibrationPlugin : FlutterPlugin {
    private var methodChannel: MethodChannel? = null
    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        teardownChannels()
    }

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        setupChannels(binding.binaryMessenger, binding.applicationContext)
    }

    private fun setupChannels(messenger: BinaryMessenger, context: Context) {
        val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        val methodChannelHandler = VibrationMethodChannelHandler(Vibration(vibrator))
        methodChannel = MethodChannel(messenger, CHANNEL)
        methodChannel!!.setMethodCallHandler(methodChannelHandler)
    }

    private fun teardownChannels() {
        methodChannel!!.setMethodCallHandler(null)
        methodChannel = null
    }

    companion object {
        private const val CHANNEL = "com.gaetanschwartz.vibrate/channel"
    }
}