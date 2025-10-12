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
}