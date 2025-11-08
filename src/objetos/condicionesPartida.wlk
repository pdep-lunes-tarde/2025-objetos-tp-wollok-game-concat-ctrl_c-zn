import wollok.game.*
import badIceCream.*
import objetos.hielo.*
import src.utils.direcciones.*

class AccionesPartida{
    const posicion = game.center()
    
    method position(){
        return posicion
    }
}

object restart inherits AccionesPartida{
    const imagen = "Restart.png"

    method image(){
        return imagen
    }

}

object win inherits AccionesPartida{
    const imagen = "win.png"

    method image(){
        return imagen
    }
}