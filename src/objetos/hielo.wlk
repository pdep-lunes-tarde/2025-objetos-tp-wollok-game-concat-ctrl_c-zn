import src.utils.direcciones.*
import badIceCream.*
import wollok.game.*

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

    method hayHieloEn(posicionHielo) {
        return badIceCream.hayHielo(posicionHielo)
    }

    method crearHielosDesde(posicionHielo, direccion) {
        if (badIceCream.dentroDeLosLimites(posicionHielo) && !self.hayHieloEn(posicionHielo)) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)

            game.addVisual(nuevoHielo)
            badIceCream.aniadirHielo(nuevoHielo)

            self.crearHielosDesde(direccion.siguientePosicion(posicionHielo), direccion)
        }
    }

    method romperFilaDesde(posicionHielo, direccion) {
        if (badIceCream.dentroDeLosLimites(posicionHielo) && self.hayHieloEn(posicionHielo)) {
            const hielo = badIceCream.obtenerHielo(posicionHielo)
            game.removeVisual(hielo)
            badIceCream.eliminarHielo(hielo)

            self.romperFilaDesde(direccion.siguientePosicion(posicionHielo), direccion)
        }
    }

    method crearBordesDeHielo(){
        const ancho = badIceCream.ancho()
        const alto = badIceCream.alto()
        var hielos = []

        (0..(ancho - 1)).forEach { x =>
            const hielo = new Hielo()
            hielo.position(new Position(x = x, y = alto - 1))
            hielos.add(hielo)
        }

        (0..(ancho - 1)).forEach { x =>
            const hielo = new Hielo()
            hielo.position(new Position(x = x, y = 0))
            hielos.add(hielo)
        }

        (0..(alto - 1)).forEach { y =>
            const hielo = new Hielo()
            hielo.position(new Position(x = 0, y = y))
            hielos.add(hielo)
        }

        (0..(alto - 1)).forEach { y =>
            const hielo = new Hielo()
            hielo.position(new Position(x = ancho-1, y = y))
            hielos.add(hielo)
        }

        return hielos
    }
}