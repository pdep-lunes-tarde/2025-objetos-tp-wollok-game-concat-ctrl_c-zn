import wollok.game.*
import personajes.helado.*
import utils.direcciones.*
import objetos.fruta.*
import objetos.hielo.*
import objetos.condicionesPartida.*
import personajes.monstruo.*
import niveles.nivel_1.*
import niveles.nivel_2.*
import niveles.nivel_3.*

object badIceCream {
    var frutas = []
    var hielos = []
    var monstruos = []
    var nivel = nivel_1

    method ancho(){
        return 16
    }

    method alto(){
        return 16
    }


    method configurar(){
        game.boardGround("background.png")

        frutas = nivel.get_frutasIniciales()
        frutas.forEach({ fruta => game.addVisual(fruta) })

        hielos = new Hielo().crearBordesDeHielo()
        hielos += nivel.get_hielosIniciales()

        hielos.forEach({hielo => game.addVisual(hielo)})

        monstruos = nivel.get_monstruosIniciales()
        monstruos.forEach({ monstruo => game.addVisual(monstruo) })

        vainilla.init(nivel.get_posicionInicialHelado())
        game.addVisual(vainilla)

        game.onTick(300, "movimiento_monstruo", { monstruos.forEach({ monstruo => monstruo.move() }) })

        game.onCollideDo(vainilla, { otro =>
            if(monstruos.contains(otro) && !game.hasVisual(win)){
                vainilla.chocasteConMonstruo(monstruos)
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
            if(game.hasVisual(restart)){
                self.restart()
            }
            else if(game.hasVisual(win)){
                self.pasarDeNivel()
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
    
    method mePuedoMover(posicionNueva) = self.dentroDeLosLimites(posicionNueva) && !self.hayHielo(posicionNueva)

    method puedoRoperHieloEn(posicionNueva) = self.dentroDeLosLimites(posicionNueva) && self.hayHielo(posicionNueva)

    
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
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)
        
        self.configurar()
        game.start()
    }

    method restart() {
        monstruos.forEach({monstruo => monstruo.init()})
        game.clear()
        self.configurar()
    }

    method pasarDeNivel() {
        nivel = nivel.pasarDeNivel()
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

