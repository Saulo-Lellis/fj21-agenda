
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<c:import url="cabecalho.jsp" />


	<!-- cria a lista -->
	<!--<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao" /> -->

	<table>

		<!--percorre contatos montando a linha da tabela -->


		<!-- tr � coluna -->


		<tr>

			<!-- Linha -->
			<td>Nome</td>
			<td>E-mail</td>
			<td>Endere�o</td>
			<td>Data de Nascimento</td>

		</tr>

		<!-- for -->
		<!--<c:forEach var="contato" items="${dao.lista}" varStatus="id">-->


		<c:forEach var="contato" items="${contatos}" varStatus="id">

			<!-- COR DAS LINHAS -->
			<tr bgcolor="#${id.count % 2 == 0 ? 'D4 A5 20' : '80 80 80'}">

				<td>${contato.nome}</td>

				<!-- Verifica��o de email vazio -->
				<td><c:choose>

						<c:when test="${not empty contato.email}">
				
				${contato.email}
			
				</c:when>

						<c:otherwise>
			
						Email n�o informado			
			
					</c:otherwise>

					</c:choose></td>

				<td>${contato.endereco}</td>


				<td>
					<!-- convertendo data --> <fmt:formatDate
						value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy" />

				</td>

				<td><a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>

				</td>

			</tr>

		</c:forEach>
		</c:forEach>

	</table>

	<c:import url="rodape.jsp" />

</body>
</html>