package net.valdemarjr.application.infraestrutura.hibernatedao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.valdemarjr.application.dominios.entidades.Celular;
import net.valdemarjr.application.infraestrutura.conexao.ConexaoBD;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository("repoCelular")
public class CelularDAO extends AbstractDAO implements RepositorioCelular {

	private Logger log = Logger.getLogger(CelularDAO.class);

	@Override
	public Celular atualizar(Celular celular) throws Exception {

		try {

			Connection conexao = ConexaoBD.getConexao();
			Statement st = conexao.createStatement();
			int executeUpdate = st.executeUpdate("UPDATE modelos SET descricao = '" + celular.getDescricao() + "'" +
					"WHERE nome = '" + celular.getNome() + "'");
			
			if (!( executeUpdate > 0 )) {
				throw new Exception("Nenhuma linha atualizada");
			}
		} catch (Exception e) {
			log.error(e.toString());
			throw new Exception(e.toString());
		}

		return celular;
	}

	@Override
	public Boolean inserir(Celular celular) throws Exception {
		try {

			Connection conexao = ConexaoBD.getConexao();
			Statement st = conexao.createStatement();

			st.executeUpdate("INSERT INTO Modelos(nome, descricao) VALUES('"
					+ celular.getNome() + "', '" + celular.getDescricao()
					+ "')");
			return Boolean.TRUE;

		} catch (Exception e) {
			log.error(e.toString());
			return Boolean.FALSE;
		}

	}

	@Override
	public Celular pesquisarModelo(String modelo) throws Exception {
		Statement st = null;
		ResultSet rs = null;
		try {

			Connection conexao = ConexaoBD.getConexao();
			st = conexao.createStatement();

			rs = st.executeQuery("SELECT nome, descricao FROM Modelos WHERE nome LIKE '%"
							+ modelo + "%'");

			if (rs.next()) {
				Celular cel = new Celular();
				cel.setNome(rs.getString("nome"));
				cel.setDescricao(rs.getString("descricao"));
				return cel;
			}

		} catch (Exception e) {
			
			log.error(e.toString());
			
		}
		return null;
	}

	@Override
	public void remover(Celular celular) throws Exception {

		Connection conexao = ConexaoBD.getConexao();
		Statement st = conexao.createStatement();

		int executeUpdate = st.executeUpdate("DELETE FROM Modelos WHERE nome = '"
						+ celular.getNome() + "' " + "AND descricao = '"
						+ celular.getDescricao() + "'");
		if (!(executeUpdate > 0)) {
			throw new Exception("Nenhuma linha removida");
		}
	}

	@Override
	public List<Celular> listarTodos() throws SQLException {
		List<Celular> listaModelos = new ArrayList<Celular>();
		Statement st = null;
		ResultSet rs = null;
		try {

			Connection conexao = ConexaoBD.getConexao();
			st = conexao.createStatement();

			rs = st.executeQuery("SELECT nome, descricao FROM Modelos");

			while (rs.next()) {
				Celular cel = new Celular();
				cel.setNome(rs.getString("nome"));
				cel.setDescricao(rs.getString("descricao"));
				listaModelos.add(cel);
			}

		} catch (Exception e) {
			
			log.error(e.toString());
			return null;
			
		} finally {
			
			rs.close();
			st.close();
			
		}
		return listaModelos;

	}

}
