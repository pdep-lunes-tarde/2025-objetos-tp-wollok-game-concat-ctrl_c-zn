import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*
import niveles.nivel_3.nivel_3

object nivel_2 {
    const hielosIniciales = [new Hielo(posicion = new Position(x = 10, y = 10))]
    const frutasIniciales = [
        new Banana(posicion = new Position(x = 1, y = 14)),
        new Banana(posicion = new Position(x = 1, y = 1)),
        new Banana(posicion = new Position(x = 14, y = 14)),
        new Banana(posicion = new Position(x = 14, y = 1)),
        new Banana(posicion = new Position(x = 2, y = 6)),
        new Banana(posicion = new Position(x = 9, y = 4))
    ]
    const monstruosIniciales = [
        new MonstruoVerde(posicion = new Position(x = 4, y = 3)),
        new MonstruoVerde(posicion = new Position(x= 2, y = 12)),
        new MonstruoVerde(posicion = new Position(x= 13, y = 6))
    ]

    method get_hielosIniciales() {
        self.crearFilaDeHielo(1, 2, 13)
        self.crearFilaDeHielo(2, 1, 14)
        self.crearFilaDeHielo(3, 1, 2)
        self.crearFilaDeHielo(3, 6, 14)
        self.crearFilaDeHielo(4, 1, 8)
        self.crearFilaDeHielo(4, 10, 14)
        self.crearFilaDeHielo(5, 1, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 5)))
        hielosIniciales.add(new Hielo(posicion = new Position(x = 1, y = 6)))
        self.crearFilaDeHielo(6, 3, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 6)))
        self.crearFilaDeHielo(7, 1, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 7)))
        self.crearFilaDeHielo(8, 1, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 8)))
        self.crearFilaDeHielo(9, 1, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 9)))
        hielosIniciales.add(new Hielo(posicion = new Position(x = 1, y = 10)))
        self.crearFilaDeHielo(10, 3, 12)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 10)))
        hielosIniciales.add(new Hielo(posicion = new Position(x = 1, y = 11)))
        self.crearFilaDeHielo(11, 3, 14)
        self.crearFilaDeHielo(12, 3, 13)
        hielosIniciales.add(new Hielo(posicion = new Position(x = 1, y = 12)))
        hielosIniciales.add(new Hielo(posicion = new Position(x = 14, y = 12)))
        self.crearFilaDeHielo(13, 1, 5)
        self.crearFilaDeHielo(13, 10, 14)
        self.crearFilaDeHielo(14, 2, 13)

        return hielosIniciales
    }


    method crearFilaDeHielo(y, xInicial, xFinal) {
        (xInicial..xFinal).forEach { x =>
            const hielo = new Hielo(posicion = new Position(x = x, y = y))
            hielosIniciales.add(hielo)
        }
    }

    method get_frutasIniciales(){
        return frutasIniciales
    }

    method get_monstruosIniciales() {
        return monstruosIniciales
    }

    method pasarDeNivel() {
        return nivel_3
    }

    method get_posicionInicialHelado() {
        return new Position(x = 7, y = 13)
    }
}