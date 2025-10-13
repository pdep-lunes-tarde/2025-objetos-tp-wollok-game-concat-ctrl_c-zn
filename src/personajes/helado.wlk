import wollok.game.*
import badIceCream.*
import objetos.hielo.*
import objetos.condicionesPartida.*
import src.utils.direcciones.*

class Helado {
    var posicion = game.center()
    var direccion = abajo
    var perdio = false

    method perdio(){
        return perdio
    }
    
    method perdio(estado){
        perdio = estado
    }

    method position() {
        return posicion
    }

    method direccion(){
        return direccion
    }

    method direccion(nuevaDireccion){
        direccion = nuevaDireccion
    }

    method position(nuevaPosicion) {
        posicion = nuevaPosicion
    }

    method init(){
        self.position(game.center())
        self.perdio(false)
    }

    method move(nuevaDireccion) {
        const nuevaPosicion = nuevaDireccion.siguientePosicion(posicion)
        if(!self.perdio()){
            if (self.dentroDeLosLimites(nuevaPosicion) && !self.hayHieloEn(nuevaPosicion)) {
                posicion = self.posicionCorregida(nuevaPosicion)
                self.direccion(nuevaDireccion)
            }
        }
        
    }

    method posicionCorregida(posicionACorregir) {
        const nuevaY = wraparound.aplicarA(posicionACorregir.y(), 0, badIceCream.alto())
        const nuevaX = wraparound.aplicarA(posicionACorregir.x(), 0, badIceCream.ancho())

        return new Position(x = nuevaX, y = nuevaY)
    }

    method dentroDeLosLimites(posicionHielo) {
        return posicionHielo.x() >= 0 && posicionHielo.x() < badIceCream.ancho() - 1 &&
            posicionHielo.y() >= 0 && posicionHielo.y() < badIceCream.alto() - 1
    }

    method hayHieloEn(posicionHielo) {
        return badIceCream.hayHielo(posicionHielo)
    }

    method accionHielo() {
        const siguientePosicion = direccion.siguientePosicion(posicion)
        
        if (!self.perdio()) {
            if (self.dentroDeLosLimites(siguientePosicion) && !self.hayHieloEn(siguientePosicion)) {
                // Si esta en los limites y no hay hielo, crea hielo
                self.crearHielos(siguientePosicion)
            }
        
            else if (self.dentroDeLosLimites(siguientePosicion) && self.hayHieloEn(siguientePosicion)) {
                // Si esta en los limites y hay hielo, rompe la fila de hielos
                self.romperFilaDeHielos(siguientePosicion)
            }
        }
        
    }

    method crearHielos(posicionHielo) {
        if (self.dentroDeLosLimites(posicionHielo) && !self.hayHieloEn(posicionHielo)) {
            const nuevoHielo = new Hielo()
            nuevoHielo.position(posicionHielo)

            game.addVisual(nuevoHielo)
            badIceCream.aniadirHielo(nuevoHielo)

            self.crearHielos(direccion.siguientePosicion(posicionHielo))
        }   
    }

    method romperFilaDeHielos(posicionHielo) {
        if (self.dentroDeLosLimites(posicionHielo) && self.hayHieloEn(posicionHielo)) {
            const hielo = badIceCream.obtenerHielo(posicionHielo)
            game.removeVisual(hielo)

            badIceCream.eliminarHielo(hielo)

            self.romperFilaDeHielos(direccion.siguientePosicion(posicionHielo))
        }
    }

    method comerFruta() {
      const fruta = badIceCream.frutas().findOne{ unaFruta => unaFruta.position().equals(posicion)}

      if(fruta != null){
        game.removeVisual(fruta)
        badIceCream.eliminarFruta(fruta)
      }
    }

    
}

object vainilla inherits Helado{
    var imagen = "Helado_Vainilla.png"

    method image(){
        return imagen
    }
    
    method setImage(nuevaImagen){
        imagen = nuevaImagen
    }

    method chocasteConMonstruo(monstruo){
        self.perdio(true)
        self.setImage("Helado_Vainilla_Derretido.png")
        game.addVisual(restart)
    }

    override method init(){
        self.position(game.center())
        self.setImage("Helado_Vainilla.png")
        self.perdio(false)
        self.direccion(abajo)
    }

}