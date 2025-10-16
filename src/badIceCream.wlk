import wollok.game.*
import personajes.helado.*
import utils.direcciones.*
import objetos.fruta.*
import objetos.hielo.*
import objetos.condicionesPartida.*
import personajes.monstruo.*

object badIceCream {
    var frutas = []
    var hielos = []

    method ancho(){
        return 20
    }

    method alto(){
        return 20
    }

    method hielosNivel1(){
        var hielosNivel1 = []
        (5..14).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = 15, y = y))
            hielosNivel1.add(hielo)
        }
        hielosNivel1 += [
            new Hielo(posicion = new Position(x = 14, y = 15)),
            new Hielo(posicion = new Position(x = 15, y = 15)),
            new Hielo(posicion = new Position(x = 13, y = 15)),
            new Hielo(posicion = new Position(x = 13, y = 5)),
            new Hielo(posicion = new Position(x = 14, y = 5))

        ]

        return hielosNivel1
    }

    method crearFrutasNivel1() {
        return [
            new Banana(posicion = new Position(x = 4, y = 16)),
            new Banana(posicion = new Position(x = 3, y = 16)),
            new Banana(posicion = new Position(x = 3, y = 15)),
            new Banana(posicion = new Position(x = 15, y = 16)),
            new Banana(posicion = new Position(x = 16, y = 16)),
            new Banana(posicion = new Position(x = 16, y = 15)),
            new Banana(posicion = new Position(x = 3, y = 5)),
            new Banana(posicion = new Position(x = 4, y = 4)),
            new Banana(posicion = new Position(x = 3, y = 4)),
            new Banana(posicion = new Position(x = 15, y = 4)),
            new Banana(posicion = new Position(x = 16, y = 5)),
            new Banana(posicion = new Position(x = 16, y = 4))
        ]
    }
    method configurar(){
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)

        game.boardGround("background.png")

        frutas = self.crearFrutasNivel1()
        frutas.forEach({ fruta => game.addVisual(fruta) })

        hielos = new Hielo().crearBordesDeHielo()
        hielos += self.hielosNivel1()

        hielos.forEach({hielo => game.addVisual(hielo)})

        const monstruoVerde = new Monstruo()
        vainilla.init()

        game.addVisual(vainilla)
        game.addVisual(monstruoVerde)

        game.onTick(300, "movimiento_monstruo", { monstruoVerde.move() })

        game.onCollideDo(vainilla, { otro =>
            if(otro == monstruoVerde && !game.hasVisual(win)){
                vainilla.chocasteConMonstruo(monstruoVerde)
            }
        })

        game.onCollideDo(vainilla, { otro =>
            if(frutas.contains(otro)){
                otro.chocaConHelado(vainilla)
                frutas.remove(otro)
            }
            if(frutas.isEmpty()){
                game.addVisual(win)
                vainilla.perdio(true)
            }
        })

        keyboard.space().onPressDo{
             if(game.hasVisual(restart) || game.hasVisual(win)){
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

