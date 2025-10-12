import wollok.game.*
import badIceCream.*
import objetos.hielo.*
import src.utils.direcciones.*

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

        if (self.dentroDeLosLimites(nuevaPosicion) && !self.hayHieloEn(nuevaPosicion)) {
            posicion = self.posicionCorregida(nuevaPosicion)
            self.direccion(nuevaDireccion)
        }
    }

    method posicionCorregida(posicionACorregir) {
        const nuevaY = wraparound.aplicarA(posicionACorregir.y(), 0, badIceCream.alto())
        const nuevaX = wraparound.aplicarA(posicionACorregir.x(), 0, badIceCream.ancho())

        return new Position(x = nuevaX, y = nuevaY)
    }

    method dentroDeLosLimites(posicionHielo) {
        return posicionHielo.x() >= 0 && posicionHielo.x() <= badIceCream.ancho() &&
            posicionHielo.y() >= 0 && posicionHielo.y() <= badIceCream.alto()
    }

    method hayHieloEn(posicionHielo) {
        return badIceCream.hayHielo(posicionHielo)
    }

    method accionHielo() {
        const siguientePosicion = direccion.siguientePosicion(posicion)

        if (self.dentroDeLosLimites(siguientePosicion) && !self.hayHieloEn(siguientePosicion)) {
            // Si esta en los limites y no hay hielo, crea hielo
            self.crearHielos(siguientePosicion)
        }
        
        else if (self.dentroDeLosLimites(siguientePosicion) && self.hayHieloEn(siguientePosicion)) {
            // Si esta en los limites y hay hielo, rompe la fila de hielos
            self.romperFilaDeHielos(siguientePosicion)
        }
    }

    method crearHielos(posicionHielo) {
        if (self.dentroDeLosLimites(posicionHielo) && !self.hayHieloEn(posicionHielo)) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)

            game.addVisual(nuevoHielo)
            badIceCream.aniadirHielo(nuevoHielo)

            self.crearHielos(direccion.siguientePosicion(posicionHielo))
        }   
    }

    method romperFilaDeHielos(posicionHielo) {
        if (self.dentroDeLosLimites(posicionHielo) && self.hayHieloEn(posicionHielo)) {
            const hielo = badIceCream.obtenerHielo(posicionHielo)
            game.removeVisual(hielo)

            badIceCream.eliminarHielo(hielo)

            self.romperFilaDeHielos(direccion.siguientePosicion(posicionHielo))
        }
    }

    method comerFruta() {
      const fruta = badIceCream.frutas().findOne{ unaFruta => unaFruta.position().equals(posicion)}

      if(fruta != null){
        game.removeVisual(fruta)
        badIceCream.eliminarFruta(fruta)
      }
    }
}

object vainilla inherits Helado{
    override method image(){
        return "Helado Vainilla.png"
    }
}