import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*
import niveles.nivel_1.nivel_1

object nivel_2 {
    const hielosIniciales = [new Hielo(posicion = new Position(x = 10, y = 10))]
    const frutasIniciales = [
        new Banana(posicion = new Position(x = 1, y = 18)),
        new Banana(posicion = new Position(x = 18, y = 18)),
        new Banana(posicion = new Position(x = 15, y = 16)),
        new Banana(posicion = new Position(x = 3, y = 9)),
        new Banana(posicion = new Position(x = 10, y = 7)),
        new Banana(posicion = new Position(x = 1, y = 1)),
        new Banana(posicion = new Position(x = 18, y = 1))
    ]
    const monstruosIniciales = [
        new Monstruo(posicion = new Position(x = 3, y = 17)),
        new Monstruo(posicion = new Position(x= 16, y = 11)),
        new Monstruo(posicion = new Position(x= 4, y = 3))
    ]

    method get_hielosIniciales() {
        self.crearFilaDeHielo(1, 2, 17)
        self.crearFilaDeHielo(2, 1, 19)
        self.crearFilaDeHielo(3, 1, 8)
        self.crearFilaDeHielo(3, 10, 12)
        self.crearFilaDeHielo(3, 18, 19)
        self.crearFilaDeHielo(4, 1, 2)
        self.crearFilaDeHielo(4, 4, 19)
        self.crearFilaDeHielo(5, 1, 2)
        self.crearFilaDeHielo(5, 4, 19)
        self.crearFilaDeHielo(6, 1, 2)
        self.crearFilaDeHielo(6, 4, 15)
        self.crearFilaDeHielo(6, 17, 19)
        self.crearFilaDeHielo(7, 1, 2)
        self.crearFilaDeHielo(7, 4, 15)
        self.crearFilaDeHielo(7, 17, 19)
        self.crearFilaDeHielo(8, 1, 2)
        self.crearFilaDeHielo(8, 4, 15)
        self.crearFilaDeHielo(8, 17, 19)
        self.crearFilaDeHielo(9, 1, 15)
        self.crearFilaDeHielo(9, 17, 19)
        self.crearFilaDeHielo(10, 1, 6)
        self.crearFilaDeHielo(10, 8, 15)
        self.crearFilaDeHielo(10, 17, 19)
        self.crearFilaDeHielo(11, 1, 19)
        self.crearFilaDeHielo(12, 1, 19)
        self.crearFilaDeHielo(13, 1, 19)
        self.crearFilaDeHielo(14, 1, 19)
        self.crearFilaDeHielo(15, 1, 15)
        self.crearFilaDeHielo(15, 17, 19)
        self.crearFilaDeHielo(16, 1, 5)
        self.crearFilaDeHielo(16, 12, 19)
        self.crearFilaDeHielo(17, 1, 19)
        self.crearFilaDeHielo(18, 2, 17)

        return hielosIniciales
    }


    method crearFilaDeHielo(x, yInicial, yFinal) {
        (yInicial..yFinal).forEach { y =>
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
        return nivel_1
    }

    method get_posicionInicialHelado() {
        return new Position(x = 7, y = 16)
    }
}