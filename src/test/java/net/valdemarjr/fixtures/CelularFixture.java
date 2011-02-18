package net.valdemarjr.fixtures;

import net.valdemarjr.application.dominios.entidades.Celular;

public class CelularFixture {
	
	public static final String MODELO_INEXISTENTE = "milestone";
	public static final String MODELO_INEXISTENTE_DESCRICAO = "sem android";
	
	public static final String MILESTONE_2_DESCRICAO = "com android 2.2";
	public static final String MILESTONE_2 = "Milestone 2";
	
	public static final String MILESTONE_2_DESCRICAO_ALTERADA = "com android 2.2 ALTERADA";
	
	public static Celular criaCelularOK() {
		Celular celular = new Celular();

		celular.setNome(MILESTONE_2);
		celular.setDescricao(MILESTONE_2_DESCRICAO);
		
		return celular; 
	}
	
	public static Celular criaCelularInexistente() {
		Celular celular = new Celular();

		celular.setNome(CelularFixture.MODELO_INEXISTENTE);
		celular.setDescricao(CelularFixture.MODELO_INEXISTENTE_DESCRICAO);
		return celular;
	}

}
