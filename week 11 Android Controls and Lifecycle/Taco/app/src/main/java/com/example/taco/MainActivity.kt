package com.example.taco

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun createTaco(view: View) {
        var filling : CharSequence = ""
        var toppinglist = "" //String

        //views
        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        val fillingId =radioGroup.checkedRadioButtonId
        val messageTextView = findViewById<TextView>(R.id.messageTextView)
        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)
        val checkBox1 = findViewById<CheckBox>(R.id.checkBox1)
        val checkBox2 = findViewById<CheckBox>(R.id.checkBox2)
        val checkBox3 = findViewById<CheckBox>(R.id.checkBox3)
        val checkBox4 = findViewById<CheckBox>(R.id.checkBox4)
        val spinner = findViewById<Spinner>(R.id.spinner)
        val switch = findViewById<SwitchMaterial>(R.id.glutenSwitch)

        if (fillingId == -1){
            Log.i("if statement", "$fillingId")
            //Snackbar
            val fillingSnackbar = Snackbar.make(layoutRoot, "Please select a filling", Snackbar.LENGTH_SHORT)
            fillingSnackbar.show()
            //Snackbar with chaining
            //Snackbar.make(layoutRoot, "Please select a filling", Snackbar.LENGTH_SHORT).show()
        } else {
            Log.i("else statement", "$fillingId")
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
}