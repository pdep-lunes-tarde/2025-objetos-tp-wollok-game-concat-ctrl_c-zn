import wollok.game.*
import personajes.helado.*
import utils.direcciones.*
import objetos.fruta.*
import personajes.monstruo.*

object badIceCream {
    method ancho(){
        return 20
    }

    method alto(){
        return 20
    }

    const hielos = []
    const frutas = [
        new Banana(posicion = new Position(x = 12, y = 3)),
        new Banana(posicion = new Position(x = 1, y = 6)),
        new Banana(posicion = new Position(x = 9, y = 0)),
        new Banana(posicion = new Position(x = 0, y = 7)),
        new Banana(posicion = new Position(x = 20, y = 15))
    ]

    method configurar(){
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)
        game.boardGround("background.png")

        game.addVisual(frutas.get(0))
        game.addVisual(frutas.get(1))
        game.addVisual(frutas.get(2))
        game.addVisual(frutas.get(3))
        game.addVisual(frutas.get(4))

        const monstruoVerde = new Monstruo()

        game.addVisual(vainilla)
        game.addVisual(monstruoVerde)

        game.onTick(300, "movimiento_monstruo", { monstruoVerde.move() })

        game.onCollideDo(vainilla, { otro =>
            if(otro == monstruoVerde){
                vainilla.chocasteConMonstruo(monstruoVerde)
            }
        })

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

    method dentroDeLosLimites(posicion) {
        return posicion.x() >= 0 && posicion.x() <= self.ancho() &&
            posicion.y() >= 0 && posicion.y() <= self.alto()
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

    method eliminarFruta(unaFruta) {
        frutas.remove(unaFruta)
    }

    method frutas() {
        return frutas
    }

}

