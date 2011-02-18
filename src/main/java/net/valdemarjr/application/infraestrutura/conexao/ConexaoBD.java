package net.valdemarjr.application.infraestrutura.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

/**
 * Objeto que corresponde a conexão ao banco de dados.
 * 
 * @author valdemar.junior
 *
 */
public class ConexaoBD {

	private static final String CONEXÃO_FECHADA = "Conexão já fechada!";
	private static final String LOCALHOST_CELULARES = "jdbc:postgresql://localhost/celulares";
	private static final String STRING_DRIVER = "org.postgresql.Driver";
	private static Logger log = Logger.getLogger(ConexaoBD.class);
	private static final String NÃO_CONECTADO_MSG = "Não conectado";
	private static Connection conn;

	/**
	 * Padrão Singleton
	 */
	private ConexaoBD() {}
	
	/**
	 * Cria uma conexão 
	 * @return
	 * @throws Exception
	 */
	public static Connection getConexao() throws Exception {
		if (conn != null) {
			return conn;
		}
		
		try {
			
			// Step 1: Load the JDBC driver.
			Class.forName(STRING_DRIVER);
			// Step 2: Establish the connection to the database.
			String url = LOCALHOST_CELULARES;
			conn = DriverManager.getConnection(url, "postgres", "junior");
			return conn;
			
		} catch (Exception e) {
			log.info(NÃO_CONECTADO_MSG);
			throw new Exception(NÃO_CONECTADO_MSG);
		}

	}
	
	/**
	 * Método responsável por fechar a conexão com o banco de dados. É verificado se a 
	 * conexão já está fechada, depois fecha a conexão.
	 * 
	 * @throws Exception
	 */
	public static void closeConnection() throws Exception {
		if (conn.isClosed()) {
			log.info(CONEXÃO_FECHADA);
			throw new Exception(CONEXÃO_FECHADA);
		}
		log.info("Fechando conexão...");
		conn.close();
		log.info("Conexão fechada");
	}

}
