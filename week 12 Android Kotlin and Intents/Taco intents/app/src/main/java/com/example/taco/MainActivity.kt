package com.example.taco

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    lateinit var messageTextView : TextView
    lateinit var layoutRoot : ConstraintLayout
    lateinit var radioGroup : RadioGroup
    lateinit var checkBox1 : CheckBox
    lateinit var checkBox2 : CheckBox
    lateinit var checkBox3 : CheckBox
    lateinit var checkBox4 : CheckBox
    lateinit var spinner : Spinner
    lateinit var switch :SwitchMaterial
    lateinit var locationButton : Button
    lateinit var reviewTextView : TextView
    var fillingId = -1
    private var myTacoShop = TacoShop();
    private var selectedLocationPosition = 0
    private val REQUEST_CODE = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //views
        messageTextView = findViewById(R.id.messageTextView)
        layoutRoot = findViewById(R.id.root_layout)
        radioGroup = findViewById(R.id.radioGroup)
        checkBox1 = findViewById(R.id.checkBox1)
        checkBox2 = findViewById(R.id.checkBox2)
        checkBox3 = findViewById(R.id.checkBox3)
        checkBox4 = findViewById(R.id.checkBox4)
        spinner = findViewById(R.id.spinner)
        switch = findViewById(R.id.glutenSwitch)
        locationButton = findViewById(R.id.locationButton)
        reviewTextView = findViewById(R.id.reviewTextView)

        //event listener
        locationButton.setOnClickListener {
            selectedLocationPosition = spinner.selectedItemPosition
            myTacoShop.suggestTacoShop(selectedLocationPosition)
            Log.i("shop suggested", myTacoShop.name);
            Log.i("url suggested", myTacoShop.url);

            //create intent
            val intent = Intent(this, TacoActivity::class.java)
            intent.putExtra("tacoShopName", myTacoShop.name)
            intent.putExtra("tacoShopURL", myTacoShop.url)

            startActivityForResult(intent, REQUEST_CODE)
        }
    }

    fun createTaco(view: View) {
        var filling : CharSequence = ""
        var toppinglist = "" //String
        fillingId =radioGroup.checkedRadioButtonId
        if (fillingId == -1){
            //Snackbar
            val fillingSnackbar = Snackbar.make(layoutRoot, "Please select a filling", Snackbar.LENGTH_SHORT)
            fillingSnackbar.show()
            //Snackbar with chaining
            //Snackbar.make(layoutRoot, "Please select a filling", Snackbar.LENGTH_SHORT).show()
        } else {
            filling = findViewById<RadioButton>(fillingId).text

            //checkboxes
            if (checkBox1.isChecked) {
                toppinglist += " " + checkBox1.text
            }
            if (checkBox2.isChecked) {
                toppinglist += " " + checkBox2.text
            }
            if (checkBox3.isChecked) {
                toppinglist += " " + checkBox3.text
            }
            if (checkBox4.isChecked) {
                toppinglist += " " + checkBox4.text
            }
            if (toppinglist.isNotEmpty()) {
                toppinglist = "with" + toppinglist
            }

            //conditional expression
            //toppinglist = (if (toppinglist.isNotEmpty()) "with$toppinglist" else "").toString()

            //spinner
            val location = "at " + spinner.selectedItem

            //switch
            if (switch.isChecked) {
                filling = switch.text.toString() + " $filling"
            }

            //textview
            messageTextView.text = "You'd like $filling tacos $toppinglist $location"
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
        }
    }

}