import wollok.game.*
import personajes.*
import personajes.helado.*
import utils.direcciones.*
import fruta.*

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

        game.addVisual(new Banana(posicion = new Position(x = 12, y = 3)))
        game.addVisual(new Banana(posicion = new Position(x = 1, y = 6)))
        game.addVisual(new Banana(posicion = new Position(x = 9, y = 0)))
        game.addVisual(new Banana(posicion = new Position(x = 0, y = 7)))
        game.addVisual(new Banana(posicion = new Position(x = 20, y = 15)))

        game.addVisual(vainilla)

        keyboard.space().onPressDo{
            vainilla.accionHielo()
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

