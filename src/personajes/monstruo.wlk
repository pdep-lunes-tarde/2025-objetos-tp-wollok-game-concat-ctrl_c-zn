import src.badIceCream.*
import src.utils.direcciones.*
import src.personajes.helado.vainilla

class Monstruo {
    const posicionInicial = new Position(x = 3, y = 3)
    var posicion = new Position(x = 3, y = 3)
    const image = "monstruo_verde.png"
    var direccion = derecha

    method position() {
        return posicion
    }

    method image() {
        return image
    }

    method init(){
        posicion = posicionInicial
        direccion = derecha
    }

    method move() {
        const nuevaPosicion = direccion.siguientePosicion(posicion)
        
        if (badIceCream.dentroDeLosLimites(nuevaPosicion) && !badIceCream.hayHielo(nuevaPosicion)) {
            // Si no esta en el limite y no hay hielo, avanzar
            posicion = nuevaPosicion
        }
        
        else {
            // Si esta en el limite o hay hielo, cambiar direccion y avanza en la nueva direccion
            self.cambiarDireccion()
        }
    }

    method cambiarDireccion() {
        if (direccion.equals(derecha)) {
            direccion = abajo
        } else if (direccion.equals(abajo)) {
            direccion = izquierda
        } else if (direccion.equals(izquierda)) {
            direccion = arriba
        } else if (direccion.equals(arriba)) {
            direccion = derecha
        }

        self.move()
    }
}

class MonstruoAmarillo inherits Monstruo (image="YellowSquid.png") {
    override method move() {
        if (!vainilla.perdio()) {
            if (vainilla.position().x() > posicion.x()) {
                direccion = derecha
            } else if (vainilla.position().x() < posicion.x()) {
                direccion = izquierda
            } else if (vainilla.position().y() > posicion.y()) {
                direccion = arriba
            } else if (vainilla.position().y() < posicion.y()) {
                direccion = abajo

            }

            const siguientePosicion = direccion.siguientePosicion(posicion)

            if (!badIceCream.hayHielo(siguientePosicion)) {
                posicion = siguientePosicion
            }
            else {
                self.romperHielo(siguientePosicion)
            }
        }

        else {
            super()
        }
    }

    method romperHielo(posicionHielo) {
        const hielo = badIceCream.obtenerHielo(posicionHielo)
        game.removeVisual(hielo)
        badIceCream.eliminarHielo(hielo)
    }
}