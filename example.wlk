class Personaje{
  const fuerza
  const inteligencia
  var rol //guerrero, cazador o brujo CAZADOR UEDE TENER MASCOTA
  
  method potencialOfensivo() = fuerza*10+rol.potencialOfensivo()
  method esGroso() = inteligencia>50 or rol.esGroso()

  method rol(unRol){
    rol = unRol
  }
}

class Humano inherits Personaje{

}

class Orco inherits Personaje{
  override method potencialOfensivo() = fuerza*11+rol.potencialOfensivo()
  override method esGroso() =  rol.esGroso()
}

class Mascota{
  const fuerza 
  const edad
  const tieneGarras

  method potencialOfensivo() = if (tieneGarras){fuerza*2} else {fuerza}
  method esLongeva() = edad>10 
}



//{}

class Aldea inherits Ciudad{
  const cantMaxDeHabitantes
  const tamaño
  
}

class Ciudad{
  var habitantes = new List()
  method potencialOfensivoEjercito() = habitantes.forEach({h=>h.potencialOfensivo()}).sum() 
}

object guerrero {
  method extra() = 100 
  method esGroso() = self.fuerza()>50 
}

object cazador {
  const mascota = null
  method extra() = mascota.potencialOfensivo() 
  method esGroso() = self.mascota.esLongeva() 

  method mascota(unaMascota) {
    mascota = unaMascota
  }
}

object brujo {
  method extra() {}
  method esGroso() = true 
}

//cada instancia uede elegir su rol (objeto)
