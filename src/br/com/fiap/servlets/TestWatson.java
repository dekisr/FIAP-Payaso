package br.com.fiap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.watson.developer_cloud.conversation.v1.Conversation;
import com.ibm.watson.developer_cloud.conversation.v1.model.InputData;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageRequest;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;

@WebServlet("/chat")
public class TestWatson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ArrayList<String> conversa = new ArrayList<String>();

	public TestWatson() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("chatbot.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MessageResponse resp = null;
		Map context = new HashMap();

		String pergunta = request.getParameter("pergunta");
		resp = conversationAPI(pergunta, context);
		List<String> resposta = resp.getOutput().getText();
		
		context = resp.getContext();

		Collections.reverse(conversa);

		String cliente = "<p class='msgLeft'>" + pergunta + "</p>";
		conversa.add(cliente);
		
		for (String string : resposta) {			
			String watson = "<p class='msgRight'>" + string + "</p>";
			conversa.add(watson);
		}		
		
		Collections.reverse(conversa);

		request.setAttribute("conversa", conversa);

		// request.setAttribute("resposta", resposta);
		request.getRequestDispatcher("chatbot.jsp").forward(request, response);

	}

	public static MessageResponse conversationAPI(String input, Map context) {
		Conversation service = new Conversation("2017-02-03");
		service.setUsernameAndPassword("5654abc3-6363-4ce9-a979-27d87e1a4d48", "jTe41Df1OwXh");
		InputData inputData = new InputData.Builder().text(input).build();
		MessageRequest newMessage = new MessageRequest();
		newMessage.setInput(inputData);
		String workspaceId = "ed5a124e-acfd-458f-a09c-0ddc47fb7675";
		MessageOptions options = new MessageOptions.Builder(workspaceId).input(inputData).build();
		MessageResponse response = service.message(options).execute();
		return response;
	}
}
