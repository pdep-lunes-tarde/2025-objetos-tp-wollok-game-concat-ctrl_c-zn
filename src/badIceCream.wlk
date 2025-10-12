import wollok.game.*
import personajes.*

object badIceCream {
    method ancho(){
        return 20
    }

    method alto(){
        return 20
    }

    const hielos = []

    method configurar(){
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)

        game.addVisual(vainilla)

        keyboard.space().onPressDo{
            var yV = vainilla.position().y()
            var xV = vainilla.position().x()

            if (vainilla.direccion() == abajo) {
                vainilla.crearHielosAbajo(new Position(x = xV, y = yV - 1))
            } else if (vainilla.direccion() == arriba) {
                vainilla.crearHielosArriba(new Position(x = xV, y = yV + 1))
            } else if (vainilla.direccion() == izquierda) {
                vainilla.crearHielosIzquierda(new Position(x = xV - 1, y = yV))
            } else if (vainilla.direccion() == derecha) {
                vainilla.crearHielosDerecha(new Position(x = xV + 1, y = yV))
            }
           
        }

        keyboard.r().onPressDo {
            const direccion = vainilla.direccion()
            const posicion = vainilla.position()

            vainilla.romperFilaDeHielos(direccion.siguientePosicion(posicion))
        }

        keyboard.right().onPressDo {
            vainilla.move(derecha)
        }
        keyboard.left().onPressDo {
            vainilla.move(izquierda)
        }
        keyboard.up().onPressDo {
            vainilla.move(arriba)
        }
        keyboard.down().onPressDo {
            vainilla.move(abajo)
        }
    }
    
    method aniadirHielo(hielo) {
        hielos.add(hielo)
    }

    method eliminarHielo(hielo) {
        hielos.remove(hielo)
    }

    method obtenerHielo(posicion) {
        return hielos.filter({hielo => hielo.position().equals(posicion)}).first()
    }

    method jugar() {
        self.configurar()
        game.start()
    }

    method hayHielo(posicion) {
        return hielos.any({hielo => hielo.position().equals(posicion)})
    }
}
