package com.example.assessment

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class NotificationCancelReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val notificationId = intent.getIntExtra("notification_id", 0)
        IncomingCallActivity.cancelAll(context, notificationId)
    }
}