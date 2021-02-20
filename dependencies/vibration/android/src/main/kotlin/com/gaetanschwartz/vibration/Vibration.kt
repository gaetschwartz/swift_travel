package com.gaetanschwartz.vibration

import android.media.AudioAttributes
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator


class Vibration internal constructor(val vibrator: Vibrator) {

    fun vibrate(duration: Long, amplitude: Int) {
        if (vibrator.hasVibrator()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                if (vibrator.hasAmplitudeControl()) {
                    vibrator.vibrate(
                        VibrationEffect.createOneShot(duration, amplitude),
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .setUsage(AudioAttributes.USAGE_ALARM)
                            .build()
                    )
                } else {
                    vibrator.vibrate(
                        VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE),
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .setUsage(AudioAttributes.USAGE_ALARM)
                            .build()
                    )
                }
            } else {
                @Suppress("DEPRECATION")
                vibrator.vibrate(duration)
            }
        }
    }

    fun vibrate(pattern: List<Int>, repeat: Int) {
        val patternLong = LongArray(pattern.size)
        for (i in patternLong.indices) {
            patternLong[i] = pattern[i].toLong()
        }
        if (vibrator.hasVibrator()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(
                    VibrationEffect.createWaveform(patternLong, repeat), AudioAttributes.Builder()
                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .build()
                )
            } else {
                @Suppress("DEPRECATION")
                vibrator.vibrate(patternLong, repeat)
            }
        }
    }

    fun vibrate(pattern: List<Int>, repeat: Int, intensities: List<Int>) {
        val patternLong = LongArray(pattern.size)
        val intensitiesArray = IntArray(intensities.size)
        for (i in patternLong.indices) {
            patternLong[i] = pattern[i].toLong()
        }
        for (i in intensitiesArray.indices) {
            intensitiesArray[i] = intensities[i]
        }
        if (vibrator.hasVibrator()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                if (vibrator.hasAmplitudeControl()) {
                    vibrator.vibrate(
                        VibrationEffect.createWaveform(patternLong, intensitiesArray, repeat),
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .setUsage(AudioAttributes.USAGE_ALARM)
                            .build()
                    )
                } else {
                    vibrator.vibrate(
                        VibrationEffect.createWaveform(patternLong, repeat),
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .setUsage(AudioAttributes.USAGE_ALARM)
                            .build()
                    )
                }
            } else {
                @Suppress("DEPRECATION")
                vibrator.vibrate(patternLong, repeat)
            }
        }
    }

}