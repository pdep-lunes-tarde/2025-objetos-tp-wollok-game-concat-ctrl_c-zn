import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*

object nivel_3 {
    const hielosIniciales = []
    const frutasIniciales = []
    const monstruosIniciales = [
        new MonstruoAmarillo(posicionInicial = new Position(x = 16, y = 3), posicion = new Position(x = 16, y = 3))
    ]

    method get_hielosIniciales() {
        self.crearFilaDeHielo(9, 1, 19)
        self.crearFilaDeHielo(10, 1, 19)
        self.crearFilaDeHielo(11, 1, 19)
        self.crearColumnaDeHielo(9, 1, 19)
        self.crearColumnaDeHielo(10, 1, 19)
        self.crearColumnaDeHielo(11, 1, 19)
        return hielosIniciales
    }

    method get_frutasIniciales(){
        (12..19).forEach { y => 
            self.crearFilaDeBananas(y, 12, 19)
        }
        (1..8).forEach { y => 
            self.crearFilaDeBananas(y, 1, 8)
        }

        return frutasIniciales
    }

    method get_monstruosIniciales() {
        return monstruosIniciales
    }
    
    method crearFilaDeHielo(x, yInicial, yFinal) {
        (yInicial..yFinal).forEach { y =>
            const hielo = new Hielo(posicion = new Position(x = x, y = y))
            hielosIniciales.add(hielo)
        }
    }

    method crearColumnaDeHielo(y, xInicial, xFinal){
        (xInicial..xFinal).forEach { x =>
            const hielo = new Hielo(posicion = new Position(x = x, y = y))
            hielosIniciales.add(hielo)
        }
    }

    method crearFilaDeBananas(y, xInicial, xFinal) {
        (xInicial..xFinal).forEach { x =>
            if (
                (y.even() && x.even()) || (y.odd() && x.odd())
            ) {
                const banana = new Banana(posicion = new Position(x = x, y = y))
                frutasIniciales.add(banana)
            }
        }
    }


    method get_posicionInicialHelado() {
        return new Position(x = 3, y = 16)
    }
}