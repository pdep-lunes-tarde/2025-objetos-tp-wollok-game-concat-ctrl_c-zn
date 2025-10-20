import src.badIceCream.*
import src.utils.direcciones.*

class Monstruo {
    var posicion = new Position(x = 3, y = 3)
    const image = "monstruo_verde.png"
    var direccion = derecha

    method position() {
        return posicion
    }

    method image() {
        return image
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
            posicion = direccion.siguientePosicion(posicion)
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
    }
}