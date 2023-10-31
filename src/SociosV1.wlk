import ActividadesV1.*

class Socios{
	
	const edad
	const idiomasQueHabla =#{}
	const actividadesRealizadas = []
	var cantidadMaxima
	
	method idiomasQueHabla() = idiomasQueHabla
	method actividadesRealizadas() = actividadesRealizadas
	method agregarActividad(actividad){
		actividadesRealizadas.add(actividad)
	} 
	method esAdoradorDelSol(){
		return actividadesRealizadas.all(	{a => a.sirveParaBroncearse()}	)
	}
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter(	{a => a.implicaEsfuerzo()}	)
	}
	method registrarActividad(unaActividad){
		if(self.actividadesRealizadas().size() <= cantidadMaxima){
			self.error("ya llego al tope de actividades")
		}else{
			self.agregarActividad(unaActividad)	
		}
	}
	method meAtraeLaActividad(unaActividad)
		
}

class SocioTranquilo inherits Socios{
	
	override method meAtraeLaActividad(unaActividad){
		return unaActividad.diasDeActividad()>= 4
	}
	
}
class SocioCoherente inherits Socios{
	
	override method meAtraeLaActividad(unaActividad){
		return unaActividad.siverParaBroncearse() or unaActividad.implicaEsfuerzo()
	}
}
class SocioRelajado inherits Socios{
	
	override method meAtraeLaActividad(unaActividad){
		return unaActividad.idioma().any(	{a => self.contiene(a) }	)
	}
	method contiene(unIdioma){
	 	return idiomasQueHabla.contain(unIdioma)
	}
}

const Alan = new SocioRelajado(edad= 26,idiomasQueHabla="Ingles",cantidadMaxima=5 )
const Alan2 = new SocioRelajado(edad= 26,idiomasQueHabla="Espaniol",cantidadMaxima=5 )




