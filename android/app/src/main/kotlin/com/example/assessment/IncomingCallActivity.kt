package com.example.assessment

import android.app.Activity
import android.app.KeyguardManager
import android.app.Notification
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.drawable.Drawable
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.util.Log
import android.view.WindowManager
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.RequiresApi
import com.bumptech.glide.Glide
import com.bumptech.glide.request.target.CustomTarget
import com.bumptech.glide.request.transition.Transition

class IncomingCallActivity : Activity() {

    private var notificationId = 1
    private var title = ""
    private var body = ""

    @RequiresApi(Build.VERSION_CODES.O)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        instance = this
        Log.d("aklsdfjaklsdfjadlskfjklasdfj", "onCreate: ")
        notificationId = intent?.getIntExtra("id", 0)!!
        title = intent?.getStringExtra("title").toString()
        body = intent.getStringExtra("body").toString()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setTurnScreenOn(true)
            setShowWhenLocked(true)
        } else {
            window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            window.addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
            window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED)
            window.addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD)
        }

        setContentView(R.layout.activity_incoming_call)

        initView()

        // Optionally dismiss the keyguard
        val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
        keyguardManager.requestDismissKeyguard(this, null)
    }

    private fun initView() {
        val titleTextView = findViewById<TextView>(R.id.custom_title)
        titleTextView.text = title

        val bodyTextView = findViewById<TextView>(R.id.custom_body)
        bodyTextView.text = body

        val imageView = findViewById<ImageView>(R.id.custom_image)

        val button = findViewById<Button>(R.id.custom_button)

        Glide.with(applicationContext)
            .asBitmap()
            .load(R.mipmap.sample) // or URL
            .circleCrop()
            .into(object : CustomTarget<Bitmap>() {
                override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                    imageView.setImageBitmap(resource)
                }

                override fun onLoadCleared(placeholder: Drawable?) {}
            })
        button.setOnClickListener {
            cancelAll(applicationContext, notificationId)
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.cancel(notificationId) // This cancels the notification with the given ID
            // Stop the AlarmService
            val serviceIntent = Intent(this, AlarmService::class.java)
            this.stopService(serviceIntent)  // Stop the service
            finish()
        }
        wakeLockRequest(50000)
    }

    private fun wakeLockRequest(duration: Long) {

        val pm = applicationContext.getSystemService(POWER_SERVICE) as PowerManager
        val wakeLock = pm.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "Callkit:PowerManager"
        )
        wakeLock.acquire(duration)
    }

    companion object {
        var instance: IncomingCallActivity? = null
        fun getIntent(context: Context, notificationId: Int, title: String, body: String): Intent {
            return Intent(context, IncomingCallActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                putExtra("notification_id", notificationId)
                putExtra("title", title)
                putExtra("body", body)
            }
        }

        fun cancelAll(context: Context, notificationId: Int) {
            val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.cancel(notificationId) // This cancels the notification with the given ID
            instance?.let {
                if (!it.isFinishing) {
                    it.finish()
                }
            }
            // Stop the AlarmService
            val serviceIntent = Intent(context, AlarmService::class.java)
            context.stopService(serviceIntent)  // Stop the service
        }
    }
}
