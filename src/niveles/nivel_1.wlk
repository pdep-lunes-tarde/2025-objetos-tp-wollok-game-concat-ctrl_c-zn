import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*
import src.niveles.nivel_3.nivel_3

object nivel_1 {
    const frutasIniciales = [
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
        new Banana(posicion = new Position(x = 16, y = 4)),
        new Banana(posicion = new Position(x = 7, y = 7)),
        new Banana(posicion = new Position(x = 12, y = 7)),
        new Banana(posicion = new Position(x = 6, y = 10)),
        new Banana(posicion = new Position(x = 6, y = 11)),
        new Banana(posicion = new Position(x = 13, y = 10)),
        new Banana(posicion = new Position(x = 13, y = 11)),
        new Banana(posicion = new Position(x = 7, y = 13)),
        new Banana(posicion = new Position(x = 12, y = 13))
    ]
    const monstruosIniciales = [new Monstruo()]

    method get_hielosIniciales() {
        var hielosNivel1 = []
        (5..14).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = 15, y = y))
            hielosNivel1.add(hielo)
        }
        (5..15).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = 4, y = y))
            hielosNivel1.add(hielo)
        }
        hielosNivel1 += [
            new Hielo(posicion = new Position(x = 14, y = 15)),
            new Hielo(posicion = new Position(x = 15, y = 15)),
            new Hielo(posicion = new Position(x = 13, y = 15)),
            new Hielo(posicion = new Position(x = 13, y = 5)),
            new Hielo(posicion = new Position(x = 14, y = 5)),
            new Hielo(posicion = new Position(x = 6, y = 5)),
            new Hielo(posicion = new Position(x = 5, y = 5)),
            new Hielo(posicion = new Position(x = 6, y = 15)),
            new Hielo(posicion = new Position(x = 5, y = 15))
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