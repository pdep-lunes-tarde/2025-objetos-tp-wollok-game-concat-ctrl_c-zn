import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*
import src.niveles.nivel_3.nivel_3

object nivel_1 {
    const frutasIniciales = [
        new Banana(posicion = new Position(x = 2, y = 4)),
        new Banana(posicion = new Position(x = 2, y = 3)),
        new Banana(posicion = new Position(x = 3, y = 3)),
        new Banana(posicion = new Position(x = 13, y = 4)),
        new Banana(posicion = new Position(x = 13, y = 3)),
        new Banana(posicion = new Position(x = 12, y = 3)),
        new Banana(posicion = new Position(x = 2, y = 11)),
        new Banana(posicion = new Position(x = 2, y = 12)),
        new Banana(posicion = new Position(x = 3, y = 12)),
        new Banana(posicion = new Position(x = 13, y = 11)),
        new Banana(posicion = new Position(x = 13, y = 12)),
        new Banana(posicion = new Position(x = 12, y = 12)),
        new Banana(posicion = new Position(x = 6, y = 5)),
        new Banana(posicion = new Position(x = 6, y = 10)),
        new Banana(posicion = new Position(x = 5, y = 8)),
        new Banana(posicion = new Position(x = 5, y = 7)),
        new Banana(posicion = new Position(x = 9, y = 5)),
        new Banana(posicion = new Position(x = 9, y = 10)),
        new Banana(posicion = new Position(x = 10, y = 8)),
        new Banana(posicion = new Position(x = 10, y = 7))
    ]
    const monstruosIniciales = [new MonstruoVerde()]

    method get_hielosIniciales() {
        var hielosNivel1 = []
        (4..11).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = 12, y = y))
            hielosNivel1.add(hielo)
        }
        (4..11).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = 3, y = y))
            hielosNivel1.add(hielo)
        }
        hielosNivel1 += [
            new Hielo(posicion = new Position(x = 4, y = 4)),
            new Hielo(posicion = new Position(x = 5, y = 4)),
            new Hielo(posicion = new Position(x = 10, y = 4)),
            new Hielo(posicion = new Position(x = 11, y = 4)),
            new Hielo(posicion = new Position(x = 4, y = 11)),
            new Hielo(posicion = new Position(x = 5, y = 11)),
            new Hielo(posicion = new Position(x = 10, y = 11)),
            new Hielo(posicion = new Position(x = 11, y = 11))
        ]

        return hielosNivel1
    }

    method get_frutasIniciales(){
        return frutasIniciales
    }

    method get_monstruosIniciales() {
        return monstruosIniciales
    }
    
    method get_posicionInicialHelado(){
        return game.center()
    }

    method pasarDeNivel() {
        return nivel_3
    }
}