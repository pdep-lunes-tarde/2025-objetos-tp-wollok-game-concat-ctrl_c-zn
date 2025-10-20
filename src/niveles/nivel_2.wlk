import objetos.hielo.*
import objetos.fruta.*
import personajes.monstruo.*
import niveles.nivel_1.nivel_1

object nivel_2 {
    const hielosIniciales = [new Hielo(posicion = new Position(x = 10, y = 10))]
    const frutasIniciales = [new Banana(posicion = new Position(x = 5, y = 5))]
    const monstruosIniciales = [new Monstruo(posicion = new Position(x = 15, y = 15))]

    method get_hielosIniciales() {
        return hielosIniciales
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
}