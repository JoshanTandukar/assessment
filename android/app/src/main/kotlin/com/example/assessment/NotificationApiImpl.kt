package com.example.assessment

import NotificationApi
import NotificationMessage
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat

class NotificationApiImpl(private val context: Context) : NotificationApi {

    override fun sendNotification(message: NotificationMessage) {
        Log.d("asdfasdfadsfadsfadsf", "sendNotification: ")
    }

    override fun scheduleNotification(message: NotificationMessage) {
        showNotification(message)
    }

    private fun showNotification(message: NotificationMessage) {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channelId = "flutter_local_channel"

        // Create channel for Android 8.0+
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Flutter Notifications",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            notificationManager.createNotificationChannel(channel)
        }

        val builder = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setContentTitle(message.title ?: "No Title")
            .setContentText(message.body ?: "No Body")
            .setAutoCancel(true)

        // Use the provided ID or fallback to a random one
        val notificationId = message.id?.toInt() ?: System.currentTimeMillis().toInt()
        notificationManager.notify(notificationId, builder.build())
    }
}