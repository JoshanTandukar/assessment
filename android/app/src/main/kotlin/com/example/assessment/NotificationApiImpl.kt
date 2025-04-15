package com.example.assessment


import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.util.Log
import androidx.annotation.RequiresApi

class NotificationApiImpl(private val context: Context) : NotificationApi {

    override fun requestExactAlarmPermission(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
            return if (!alarmManager.canScheduleExactAlarms()) {
                val intent = Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM)
                intent.data = Uri.parse("package:${context.packageName}")
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(intent)
                false
            } else {
                true
            }
        }
        return true
    }

    @RequiresApi(Build.VERSION_CODES.S)
    override fun scheduleNotification(message: NotificationMessage): Boolean {

        Log.d("asdfasdfadsfasdfasdfadsf", "scheduleNotification: "+message.id)
        Log.d("asdfasdfadsfasdfasdfadsf", "scheduleNotification: "+message.body)
        Log.d("asdfasdfadsfasdfasdfadsf", "scheduleNotification: "+message.title)
        Log.d("asdfasdfadsfasdfasdfadsf", "scheduleNotification: "+message.scheduleTime)

        val intent = Intent(context, AlarmService::class.java).apply {
            putExtra("title", message.title)
            putExtra("body", message.body)
            putExtra("id", message.id ?: 0)
            putExtra("scheduleTime" , message.scheduleTime)
        }
        // Create a PendingIntent that will trigger the service when the alarm goes off
        val pendingIntent = PendingIntent.getService(
            context,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // Get the AlarmManager system service
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        message.scheduleTime?.let {
            alarmManager.setExactAndAllowWhileIdle(
                AlarmManager.RTC_WAKEUP,
                it,
                pendingIntent,)
        }
        return true
    }
}