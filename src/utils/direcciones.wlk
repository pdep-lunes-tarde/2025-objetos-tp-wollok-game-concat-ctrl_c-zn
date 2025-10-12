import wollok.game.*
import badIceCream.*
import objetos.hielo.*

object izquierda{
    method siguientePosicion(posicion){
        return posicion.left(1)
    }
}

object derecha{
    method siguientePosicion(posicion){
        return posicion.right(1)
    }
}

object arriba{
    method siguientePosicion(posicion){
        return posicion.up(1)
    }
}

object abajo{
    method siguientePosicion(posicion){
        return posicion.down(1)
    }
}
object sinDireccion {
    method siguientePosicion(posicion) {
        return posicion
    }
}

object wraparound {
    method aplicarA(numero, topeInferior, topeSuperior) {
        if(numero < topeInferior) {
            return topeSuperior
        } else if(numero > topeSuperior) {
            return topeInferior
        } else {
            return numero
        }
    }
}