import socios.*

class Actividades {
	const idioma = {}
	
	method idioma(idiomas){
		idioma.addAll(idiomas)
	}

	method esViajeInteresante() = idioma.size()>1
	method idioma() = idioma
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad() 
	method atrae
	
}

class ViajeDePlaya inherits Actividades{
	const largoDeLaPlaya
	
	method largoDeLaPlaya() = largoDeLaPlaya
	override method sirveParaBroncearse() = true
	override method diasDeActividad(){
		return largoDeLaPlaya / 500
	}
	override method implicaEsfuerzo(){
		return  largoDeLaPlaya > 1200
	}
}
class ExcursionALaCiudad inherits Actividades {
	var atraccionesAVisitar
	
	override method esViajeInteresante(){
		return super() or atraccionesAVisitar == 5 
	}
	method atraccionesAVisitar() = atraccionesAVisitar
	override method diasDeActividad(){
		return atraccionesAVisitar / 2
	}
	override method implicaEsfuerzo(){
		return  5 <= atraccionesAVisitar <= 8
	}
	override method sirveParaBroncearse()= false
}

class EcursionALaCiudadTropical inherits ExcursionALaCiudad{
	
	override method diasDeActividad(){
	return super() + 1
	}
	override method sirveParaBroncearse()= true
}

class SalidaDeTrekking inherits Actividades{
	var kmDeSenderos
	var diasDeSolPorAnio
	
	method kmDeSenderos() = kmDeSenderos
	method diasDeSolPorAnio() =diasDeSolPorAnio
	
	override method diasDeActividad(){
		return kmDeSenderos / 50
	}
	override method implicaEsfuerzo(){
		return  kmDeSenderos > 80 
	}
	override method sirveParaBroncearse(){
		return self.diasDeSolPorAnio().between(100,200) and self.kmDeSenderos() > 120
	}
	override method esViajeInteresante(){
		return super() and diasDeSolPorAnio > 140
	}
}
class ClasesDeGimnasia inherits Actividades (idioma = "español") {
	
	override method diasDeActividad() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
}




