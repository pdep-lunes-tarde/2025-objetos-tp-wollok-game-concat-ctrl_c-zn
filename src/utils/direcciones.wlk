import wollok.game.*
import badIceCream.*
import objetos.hielo.*

object izquierda{
    method siguientePosicion(posicion){
        return posicion.left(1)
    }

    method doblar() = arriba
}

object derecha{
    method siguientePosicion(posicion){
        return posicion.right(1)
    }

    method doblar() = abajo 
}

object arriba{
    method siguientePosicion(posicion){
        return posicion.up(1)
    }

    method doblar() = derecha 
}

object abajo{
    method siguientePosicion(posicion){
        return posicion.down(1)
    }

    method doblar() = izquierda
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