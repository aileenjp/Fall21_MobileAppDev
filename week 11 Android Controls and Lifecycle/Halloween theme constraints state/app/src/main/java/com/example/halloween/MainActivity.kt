package com.example.halloween

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    var message: String = ""
    var imageId: Int? = null
    lateinit var editName: EditText
    lateinit var booText: TextView
    lateinit var imageGhost: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //get views
        editName = findViewById<EditText>(R.id.editTextName)
        booText = findViewById<TextView>(R.id.textMessage)
        imageGhost = findViewById<ImageView>(R.id.imageView)
    }

    fun sayBoo(view: View) {
        //EditText
        val name = editName.text

        //TextView
        message = "Happy Halloween " + name + "!"

        //ImageView
        imageId = R.drawable.ghost

        updateUI()
    }

    fun updateUI(){
        //TextView
        booText.text = message
        //ImageView
        imageId?.let { imageGhost.setImageResource(it) }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
        imageId?.let { outState.putInt("image", it) }
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        imageId = savedInstanceState.getInt("image")
        updateUI()
    }
}