import wollok.game.*
import badIceCream.*

class Helado {
    var posicion = new Position(x = 10, y = 10)
    var direccion = abajo

    method image() {
        return ""
    }

    method position() {
        return posicion
    }

    method direccion(){
        return direccion
    }

    method direccion(nuevaDireccion){
        direccion = nuevaDireccion
    }

    method position(nuevaPosicion) {
        posicion = nuevaPosicion
    }

    method move(nuevaDireccion) {
        const nuevaPosicion = nuevaDireccion.siguientePosicion(posicion)
        posicion = self.posicionCorregida(nuevaPosicion)
        self.direccion(nuevaDireccion)
    }

    method posicionCorregida(posicionACorregir) {
        const nuevaY = wraparound.aplicarA(posicionACorregir.y(), 0, badIceCream.alto())
        const nuevaX = wraparound.aplicarA(posicionACorregir.x(), 0, badIceCream.ancho())

        return new Position(x = nuevaX, y = nuevaY)
    }

    method crearHielosAbajo(posicionHielo) {
        if (posicionHielo.y() >= 0 && posicionHielo.y() <= badIceCream.alto()) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)
            game.addVisual(nuevoHielo)
            self.crearHielosAbajo(posicionHielo.down(1))
        }
    }

    method crearHielosArriba(posicionHielo) {
        if (posicionHielo.y() >= 0 && posicionHielo.y() <= badIceCream.alto()) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)
            game.addVisual(nuevoHielo)
            self.crearHielosArriba(posicionHielo.up(1))
        }
    }

    method crearHielosIzquierda(posicionHielo) {
        if (posicionHielo.x() >= 0 && posicionHielo.x() <= badIceCream.ancho()) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)
            game.addVisual(nuevoHielo)
            self.crearHielosIzquierda(posicionHielo.left(1))
        }
    }

    method crearHielosDerecha(posicionHielo) {
        if (posicionHielo.x() >= 0 && posicionHielo.x() <= badIceCream.ancho()) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)
            game.addVisual(nuevoHielo)
            self.crearHielosDerecha(posicionHielo.right(1))
        }
    }
}

object vainilla inherits Helado{
    override method image(){
        return "Helado Vainilla.png"
    }
}

class Hielo {
    var posicion = new Position(x=0, y=0)
    
    method image(){
        return "BloqueHielo.png"
    }

    method position() {
        return posicion
    }

    method position(nuevaPosicion) {
        posicion = nuevaPosicion
    }
}

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