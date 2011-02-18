package net.valdemarjr.application.infraestrutura.hibernatedao;

import java.sql.SQLException;
import java.util.List;

import net.valdemarjr.application.dominios.entidades.Celular;

/**
 * 
 * Classe responsável por possuir as assinaturas dos métodos responsáveis pela manipulação/operações 
 * das informações da entidade Celular. 
 * 
 * @author valdemar.junior
 *
 */
public interface RepositorioCelular {

	/**
	 * Método responsável por pesquisar um celular pelo nome do modelo;
	 * 
	 * @param modelo
	 * @return
	 * @throws Exception
	 */
	public Celular pesquisarModelo(String modelo) throws Exception;;
	
	/**
	 * Método responsável por remover um celular cadastrado. O dados chave para exclusão 
	 * serão o nome e a descrição do celular
	 * 
	 * @param celular
	 * @throws Exception
	 */
	public void remover(Celular celular) throws Exception;;
	
	/**
	 * Insere um novo modelo de celular no sistema. Os atributos nome e descrição são obrigatórios.
	 * 
	 * @param celular
	 * @return
	 * @throws Exception
	 */
	public Boolean inserir(Celular celular) throws Exception;;
	
	/**
	 * Método para atualizar os dados de um celular. Apenas será possível atualizar a descrição do modelo do celular.
	 * 
	 * @param celular
	 * @return
	 * @throws Exception
	 */
	public Celular atualizar(Celular celular) throws Exception;

	/**
	 * Lista todos os modelos dos celulares cadastrados no sistema
	 * @return
	 * @throws SQLException
	 */
	public List<Celular> listarTodos() throws Exception;

}
