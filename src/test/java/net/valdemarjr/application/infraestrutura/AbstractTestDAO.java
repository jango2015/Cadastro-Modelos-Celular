package net.valdemarjr.application.infraestrutura;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;


/**
 * Classe responsável por possuir as operações em comum com todas as entidades/operações
 * do sistema. Operações de CRUD, Log e etc.
 * 
 * As classes de DAO devem estender essa classe
 * 
 * @author valdemar.junior
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/spring-mvc-forTests.xml" })
@Transactional
public class AbstractTestDAO {
	
	protected MockHttpServletRequest request = new MockHttpServletRequest();
	protected MockHttpServletResponse response = new MockHttpServletResponse();
	protected MockHttpSession session = new MockHttpSession();
	
	@Autowired
	protected AnnotationMethodHandlerAdapter handlerAdapter;
	

}
