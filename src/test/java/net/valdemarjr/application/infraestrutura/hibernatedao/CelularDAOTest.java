package net.valdemarjr.application.infraestrutura.hibernatedao;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;
import static junit.framework.Assert.assertTrue;

import java.util.List;

import net.valdemarjr.application.dominios.entidades.Celular;
import net.valdemarjr.application.infraestrutura.AbstractTestDAO;
import net.valdemarjr.fixtures.CelularFixture;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Classe responsável por testar os métodos da classe CelularDAO
 * @author javaflores
 *
 */
public class CelularDAOTest extends AbstractTestDAO {
	
	@Autowired
	private RepositorioCelular repoCelular;
	
	@Test
	@Before
	public void testInserir() throws Exception {
	
		Boolean inserirOK = repoCelular.inserir(CelularFixture.criaCelularOK());
		
		assertTrue(inserirOK);
	}
	
	@Test
	public void testPesquisarModeloOK() throws Exception {
		Celular mod = repoCelular.pesquisarModelo(CelularFixture.MILESTONE_2);
		assertEquals(CelularFixture.MILESTONE_2, mod.getNome());
		assertEquals(CelularFixture.MILESTONE_2_DESCRICAO, mod.getDescricao());

	}
	
	@Test
	public void testPesquisarModeloOKInexistente() throws Exception {
		Celular result = repoCelular.pesquisarModelo(CelularFixture.MODELO_INEXISTENTE);
		assertNull(result);

	}
	
	@Test
	public void testAtualizar() throws Exception {
		
		Celular celularOK = CelularFixture.criaCelularOK();
		celularOK.setDescricao(CelularFixture.MILESTONE_2_DESCRICAO_ALTERADA);
		
		repoCelular.atualizar(celularOK); // Se não lançar exception Test OK
		
		repoCelular.atualizar(CelularFixture.criaCelularOK()); // atualiza para valor anterior 
	}
	
	@Test(expected = Exception.class)
	public void testRemoverModeloInexistente() throws Exception {
		
		repoCelular.remover(CelularFixture.criaCelularInexistente());
		
	}
	
	@Test(expected = Exception.class)
	public void testAtualizarInexistente() throws Exception {
		
		repoCelular.atualizar(CelularFixture.criaCelularInexistente());
	}
	
	@Test
	public void testListaTodos() throws Exception {
		List<Celular> listaModelos = repoCelular.listarTodos();
		assertTrue(listaModelos.size() > 0);
	}
	
	@After
	public void testRemoverModeloOK() throws Exception {
		repoCelular.remover(CelularFixture.criaCelularOK());

	}
	
	
}

