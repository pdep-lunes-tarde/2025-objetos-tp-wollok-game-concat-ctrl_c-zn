import wollok.game.*
import badIceCream.*

class Fruta{
    var posicion

    method position(){
        return posicion
    }

    method posicionFruta(newX, newY){
        posicion = new Position(x = newX, y = newY)
    }
}

class Banana inherits Fruta {
    method image() {
        return 'banana.png'
    }
}

