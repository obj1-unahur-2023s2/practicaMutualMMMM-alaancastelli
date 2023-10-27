import actividades.*

class Socios {
	const actividadRealizadas = []
	var maximoDeActividades
	
	method actividadRealizadas() = actividadRealizadas
	method esAdoradorDelSol(){
		return actividadRealizadas.all ( {a => a.sirveParaBroncearse()} )
	}
	method actividadesEsforzadas(){
		return actividadRealizadas.filter(	{a => a.implicaEsfuerzo()}	)
	}
	method sumarActividad(unaActividad){
		if (actividadRealizadas.size()+1 >= maximoDeActividades){
			 self.error("no puede realizar mas actividades")
		}else{
			actividadRealizadas.add(unaActividad)
		}
	}
	
	
}
