package com.example.assessment

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.drawable.Drawable
import android.media.RingtoneManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import com.bumptech.glide.Glide
import com.bumptech.glide.request.target.CustomTarget
import com.bumptech.glide.request.transition.Transition

class AlarmService : Service() {

    private var notificationId = 1  // Unique notification ID
    private var title = ""
    private var body = ""

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent != null) {
            remoteNotification(intent)
        }
        else{
            return START_NOT_STICKY
        }
        return START_NOT_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun remoteNotification(intent: Intent): Int {
        title = intent.getStringExtra("title") ?: "Incoming Call"
        body = intent.getStringExtra("body") ?: "Answer or ignore"
        notificationId = intent.getIntExtra("id", 0)

        val notificationManager = this.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channelId = "todo_notification"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Todo Notifications",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                enableVibration(true)
                setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE), null)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            }
            notificationManager.createNotificationChannel(channel)
        }
        val cancelIntent = Intent(applicationContext, NotificationCancelReceiver::class.java)
        cancelIntent.putExtra("notification_id", notificationId) // Pass the notification ID to cancel
        val cancelPendingIntent = PendingIntent.getBroadcast(
            applicationContext,
            0,
            cancelIntent,
            getFlagPendingIntent()
        )
        val remoteView = RemoteViews(this.packageName, R.layout.custom_notification)
        remoteView.apply {
            setTextViewText(R.id.custom_title, title)
            setTextViewText(R.id.custom_body, body)
            setOnClickPendingIntent(R.id.custom_button, cancelPendingIntent)
        }

        val soundUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE)

        val builder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.sample)
            .setChannelId(channelId)
            .setOngoing(true)
            .setWhen(0)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_CALL)
            .setSound(soundUri)
            .setOnlyAlertOnce(true)
            .setTimeoutAfter(3000)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(remoteView)
            .setFullScreenIntent(getActivityPendingIntent(notificationId, title, body), true)
            .setContentIntent(getActivityPendingIntent(notificationId, title, body))
            .setAutoCancel(false)

        val notification = builder.build()

        // Show the notification
        Glide.with(applicationContext)
            .asBitmap()
            .load(R.mipmap.sample) // or URL
            .circleCrop()
            .into(object : CustomTarget<Bitmap>() {
                override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                    remoteView.setImageViewBitmap(R.id.custom_image, resource)
                    notification.flags = Notification.FLAG_INSISTENT
                    notificationManager.notify(notificationId, notification)
                    // Start the service in the foreground
                    startForeground(notificationId, notification)
                    Handler(Looper.getMainLooper()).postDelayed({
                        IncomingCallActivity.cancelAll(applicationContext, notificationId)
                    }, 30000)
                }

                override fun onLoadCleared(placeholder: Drawable?) {}
            })
        return START_STICKY
    }

    private fun getActivityPendingIntent(id: Int, title: String, body: String): PendingIntent {
        val intent = IncomingCallActivity.getIntent(applicationContext, id, title, body)
        return PendingIntent.getActivity(applicationContext, id, intent, getFlagPendingIntent())
    }

    private fun getFlagPendingIntent(): Int {
        return PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
    }
}