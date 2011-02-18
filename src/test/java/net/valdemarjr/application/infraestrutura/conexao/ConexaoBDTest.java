package net.valdemarjr.application.infraestrutura.conexao;

import java.sql.Connection; 

import org.junit.Test;

import junit.framework.Assert;

public class ConexaoBDTest {

	@Test
	public void testConexaoBD() throws Exception {
		
		Connection conexao = ConexaoBD.getConexao();
		Assert.assertNotNull(conexao);
	}
	
}
