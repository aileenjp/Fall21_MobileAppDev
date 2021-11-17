package com.example.taco

data class TacoShop(var name: String="", var url: String=""){
    fun suggestTacoShop(position:Int){
        setTacoShopName(position)
        setTacoShopUrl(position)
    }

    private fun setTacoShopName(position:Int){
        when (position) {
            0 -> name="Illegal Petes"
            1 -> name="Chipotle "
            2 -> name="Bartaco"
            else -> name="taco shop of your choice"
        }
    }

    private fun setTacoShopUrl(position:Int){
        when (position) {
            0-> url="https://www.illegalpetes.com"
            1 -> url="https://locations.chipotle.com/co/boulder/1650-28th-st"
            2 -> url="https://bartaco.com/"
            else -> url="https://www.google.com/search?q=boulder+taco+shop"
        }
    }
}
