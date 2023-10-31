

class Actividades {
	
	var idioma= #{}
	
	method agregarIdioma(unIdioma){
		idioma.add(unIdioma)
	}
	method esActividadInteresante() = idioma.size()> 1
	method idioma() = idioma
	method implicaEsfuerzo()
	method sirveParaBroncearse() = true
	method diasDeActividad()
	method esActividadRecomendablePara(unSocio)
}

class Viajes inherits Actividades{
	
	override method esActividadRecomendablePara(unSocio){
		return unSocio.esActividadInteresante() and 
			   unSocio.meAtraeLaActividad(self) and 
			  !unSocio.actividadesRealizadas().contain(self)
	}
}

class ViajeDePlaya inherits Viajes{
	const largoPlaya
	
	method largoPlaya() = largoPlaya
	override method diasDeActividad(){
		return largoPlaya / 500	
	}
	override method implicaEsfuerzo(){
		return largoPlaya > 1200
	}
	
}

class ExcursionALaCiudad inherits Viajes{
	var cantidadAvisitar
	
	override method esActividadInteresante(){
		return super() or cantidadAvisitar == 5
	}
	override method diasDeActividad(){
		return cantidadAvisitar / 2	
	}
	override method implicaEsfuerzo(){
		return  5 < cantidadAvisitar <8
	}
	override method sirveParaBroncearse() = false
}

class ExcursionCiudadTropical inherits Viajes{
	
	override method diasDeActividad(){
		return super() + 1
	}
	
}
class SalidaDeTrekkin inherits Viajes{
	var cantidadDeKm
	var diasDeSolPorAnio
	
	override method esActividadInteresante(){
		return super() or diasDeSolPorAnio > 140
	}
	override method diasDeActividad(){
		return cantidadDeKm / 50
	}
	override method implicaEsfuerzo(){
		return  cantidadDeKm > 80
	}
	override method sirveParaBroncearse(){
		return diasDeSolPorAnio > 200 or self.condicionAdicional()
	}
	method condicionAdicional(){
		return diasDeSolPorAnio.between(100,200) or cantidadDeKm > 120
	}
	
}

class ClaseDeGimnasia inherits Actividades{
	
	override method idioma() = "Espaniol"
	
	override method diasDeActividad()= 1
	override method implicaEsfuerzo()= true
	override method sirveParaBroncearse() = false
	
		override method esActividadRecomendablePara(unSocio){
			return unSocio.edad().between(20,30)
		}
	
	
}

 
class TallerLiterario inherits Actividades {
	const libros=[]
	
	method libros() = libros
	method agregarLibros(algunosLibros){
		libros.addAll(algunosLibros)
	}
	method idiomasUsados(){
		return libros.map(	{a => a.idioma()}	)
	}
	override method diasDeActividad(){
		return libros.size() + 1
	}
	override method implicaEsfuerzo(){
		return self.hayAlgunoConMasDe500() or self.sonTodosDelMismoAutor() 
	}
	method hayAlgunoConMasDe500(){
		return libros.any(	{a => a.cantidadDePaginas()> 500}	)
	}
	method sonTodosDelMismoAutor(){
		return libros.size()>1 and self.autores().size() == 1
	}
	method autores(){
		return libros.map(	{a => a.autor()}	).asSet() 
	}
	override method sirveParaBroncearse() = false
	
	override method esActividadRecomendablePara(unSocio){
		return unSocio.idiomasQueHabla().size() > 1
	}
	
}

class Libro {
	const idioma
	const cantidadDePaginas
	const autor
	
	method idioma() = idioma
	method cantidadDePaginas()= cantidadDePaginas
	method autor() = autor
	
}

















