object pepita {
  var energia = 100

  method energia() = energia

  method volar(distancia) {
    self.validarVolar(distancia)
    energia = energia - self.energiaParaVolar(distancia)
  }

  method validarVolar(distancia) {
    if (energia < self.energiaParaVolar(distancia)) {
      self.error("No puedo volar esta distancia")
    }
  }

  method energiaParaVolar(distancia) {
    return 10 + distancia
  }

  method comer(alimento) {
    energia = energia + alimento.energiaQueAporta()
  }

}

object alpiste {
  method energiaQueAporta() = 20
}

object miAsserter {

    method assertException(bloque) {

      try {
        bloque.apply() //ejecuto el bloque
        return false //no anda como espero
      }
      catch e: Exception {
        return true //anda como espero
      } 
      
    }

}

object roque {
  var property aves = #{pepita, pepon} 
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
    aves.forEach({
      ave =>
      ave.comer(alimento)
    })
		cenas = cenas + 1
	}

	method cenas() {
	  return cenas
	}

  var rutina = {}

  method  rutina(_rutina){
    rutina = _rutina
  }


  method entrenar(){
    rutina.apply(ave)
  }

  method avesConMasDe(energia) {
    return aves.filter({ave =>
    ave.energia() > energia
    })
  }

  method energiaDeAves(){
    return aves.map({ave => //devuelve una lista
    ave.energia()})
  }
}

object pepon {
  var energia = 30

	var ultima_cena = alpiste
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		if (comida == ultima_cena){
			self.error("Ya comi eso la ultima vez master, dame otra cosa")
		}
		energia += energia + comida.energiaQueAporta() / 2
		ultima_cena = comida
	}

	method energia_para_volar(distancia){
		return 20 + 2*distancia
	}
		
	method volar(distancia) {
    self.validarVolar(distancia)
		energia = energia - self.energia_para_volar(distancia)
	}

  method validarVolar(distancia) {
    if (energia < self.energia_para_volar(distancia)) {
      self.error("No puedo volar esta distancia")
    }
  }

	method puedo_volar(distancia){
		return energia >= self.energia_para_volar(distancia)
  }
}