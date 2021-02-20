package com.gaetanschwartz.vibration

import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


internal class VibrationMethodChannelHandler(vibrationPlugin: Vibration?) :
    MethodCallHandler {
    private val vibration: Vibration?
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "hasVibrator" -> result.success(vibration!!.vibrator.hasVibrator())
            "hasAmplitudeControl" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                result.success(vibration!!.vibrator.hasAmplitudeControl())
            } else {
                result.success(false)
            }
            "hasCustomVibrationsSupport" -> result.success(true)
            "vibrate" -> {
                val duration = call.argument<Int>("duration")!!
                val pattern = call.argument<List<Int>>("pattern")!!
                val repeat = call.argument<Int>("repeat")!!
                val intensities = call.argument<List<Int>>("intensities")!!
                val amplitude = call.argument<Int>("amplitude")!!
                if (pattern.isNotEmpty() && intensities.isNotEmpty()) {
                    vibration!!.vibrate(pattern, repeat, intensities)
                } else if (pattern.isNotEmpty()) {
                    vibration!!.vibrate(pattern, repeat)
                } else {
                    vibration!!.vibrate(duration.toLong(), amplitude)
                }
                result.success(null)
            }
            "cancel" -> {
                vibration!!.vibrator.cancel()
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    init {
        assert(vibrationPlugin != null)
        vibration = vibrationPlugin
    }
}