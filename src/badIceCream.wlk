import wollok.game.*
import personajes.helado.*
import utils.direcciones.*
import objetos.fruta.*
import objetos.condicionesPartida.*
import personajes.monstruo.*

object badIceCream {
    var frutas = []
    const hielos = []

    method ancho(){
        return 20
    }

    method alto(){
        return 20
    }

    method crearFrutas() {
        return [
            new Banana(posicion = new Position(x = 12, y = 3)),
            new Banana(posicion = new Position(x = 1, y = 6)),
            new Banana(posicion = new Position(x = 9, y = 0)),
            new Banana(posicion = new Position(x = 0, y = 7)),
            new Banana(posicion = new Position(x = 18, y = 15))
        ]
    }
    method configurar(){
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)

        game.boardGround("background.png")

        frutas = self.crearFrutas()
        frutas.forEach({ fruta => game.addVisual(fruta) })


        const monstruoVerde = new Monstruo()
        vainilla.init()

        game.addVisual(vainilla)
        game.addVisual(monstruoVerde)

        game.onTick(300, "movimiento_monstruo", { monstruoVerde.move() })

        game.onCollideDo(vainilla, { otro =>
            if(otro == monstruoVerde){
                vainilla.chocasteConMonstruo(monstruoVerde)
            }
        })

        game.onCollideDo(vainilla, { otro =>
            if(frutas.contains(otro)){
                otro.chocaConHelado(vainilla)
                frutas.remove(otro)
            }
            if(frutas.isEmpty()){
                // objeto para ganar, no creado
            }
        })

        keyboard.space().onPressDo{
             if(game.hasVisual(restart)){
                self.restart()
            }
            else {
                vainilla.accionHielo()
            }
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

    method dentroDeLosLimites(nuevaPosicion) {
        return nuevaPosicion.x() >= 0 && nuevaPosicion.x() < self.ancho() - 1 &&
           nuevaPosicion.y() >= 0 && nuevaPosicion.y() < self.alto() - 1
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

    method restart() {
        game.clear()
        self.configurar()
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

