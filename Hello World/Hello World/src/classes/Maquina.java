package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Maquina {
	private int	   	idMaquina;
	private String 	nome;
	private String 	categoria;
	private String  imagem;
	private String 	preco;
	private String  status;
	
	private String tableName	= "rentmach.maquinas"; 
	private String fieldsName	= "idMaquina, nome, categoria, imagem, preco, status";  
	private String fieldKey		= "idMaquina";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	public Maquina() {
		this.tableName = "rentmach.maquinas";
		this.fieldsName = "idMaquina, nome, categoria, imagem, preco, status";  
		this.fieldKey = "idMaquina";
		this.dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	}
	
	public String listCards() {
		ResultSet rs = this.dbQuery.select("status=\"Disponível\"");
		String saida = "";
		try {
					while(rs.next()) {
						saida += "<div class=\"card\">";
							saida += "<div style=\"margin: 10px;\">";
								saida += "<img style=\"margin: 0 auto;\" width=\"100%\" height=\"150px\" src=\"" +rs.getString("imagem")+ "\"/>";
								saida += "<h3 style=\"font-family: 'Quicksand', sans-serif; margin-top: 10px;\" >"+rs.getString("nome")+"</h3>";
								saida += "<h5>Categoria: "+rs.getString("categoria")+"</h5>";
								saida += "<h5>"+rs.getString("preco")+" por mês</h5>";
							saida += "</div>";
							saida += "<div style=\"text-align: center;\">";
								saida += "<a href=\"rent.jsp?id="+rs.getString("idMaquina")+"\" ><button class=\"btn btn-success\" style=\"width: 90%;margin-top: 10px\">Alugar</button></a>";
							saida += "</div>";
						saida += "</div>";
					}
			
		}
		 catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public String listAllMachs() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		try {
				saida += "<h5 style=\"color: #FCB830; font-family: 'Quicksand', sans-serif; margin-top: 5px;\">Máquinas</h5>";
				saida += "<div id=\"machTable\">";
					saida += "<br/><button id=\"btnAddMach\" data-toggle=\"modal\"\" data-target=\"#modalAddMach\" style=\"background-color: #FCB830;\" class=\"btn ml-1\" type=\"button\">Adicionar Máquina</button>\n" +"";
					saida += "<table>";
						saida += "<thead>";
							saida += "<th>idMaquina</th>";
							saida += "<th>Nome</th>";
							saida += "<th>Categoria</th>";
							saida += "<th>Imagem</th>";
							saida += "<th>Preço</th>";
							saida += "<th>Status</th>";
							saida += "<th>Ações</th>";
						saida += "</thead>";
						saida += "<tbody>";
						while(rs.next()) {
							saida += "<form action=\"editMach.jsp\">";
								saida += "<tr>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"id\" value=\""+ rs.getString("idMaquina") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"nome\" value=\""+ rs.getString("nome") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"categoria\" value=\""+ rs.getString("categoria") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"imagem\" value=\""+ rs.getString("imagem") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"preco\" value=\""+ rs.getString("preco") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"status\" value=\""+ rs.getString("status") +"\"></td>";
									saida += "<td style=\"max-height: 80px;height: 50px;\"><button style=\"cursor: pointer;\" type=\"submit\" class=\"btn btn-success\" onclick=\"this.form.submit()\"><img width=\"20px\" src=\"img/editIcon.png\" /></button><a href=\"delMach.jsp?id="+ rs.getString("idMaquina") + "\"><button type=\"submit\" style=\"margin-left: 5px;\" class=\"btn btn-danger\" ><img width=\"20px\" src=\"img/delIcon.png\" /></a></button></td>\n" + "";
									saida += "</form>";
								saida += "</tr>";
								
						}
						saida += "</tbody>";
					saida += "</table>";
				saida += "</div><br/><br/>";
			
		}
		 catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public Maquina(int idMaquina) {
		this.setIdMaquina(idMaquina);
	}
	

	public Maquina( int idMaquina, String nome, String categoria, String imagem, String preco, String status) {
		this.setIdMaquina(idMaquina);
		this.setNome(nome);
		this.setCategoria(categoria);
		this.setImagem(imagem);
		this.setPreco(preco);
		this.setStatus(status);
	}
	
	public Maquina( String idMaquina, String nome, String categoria, String imagem, String preco, String status) {
		this.setIdMaquina(((idMaquina == null)?0:Integer.valueOf(idMaquina)));
		this.setNome(nome);
		this.setCategoria(categoria);
		this.setImagem(categoria);
		this.setPreco(preco);
		this.setStatus(status);
	}
	
	public String toString() {
		return(
				this.getIdMaquina() + ""+" | "+
				this.getNome() + ""+" | "+
				this.getCategoria()+" | "+
				this.getImagem()+" | "+
				this.getPreco()+" | "+
				this.getStatus()+" | "
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdMaquina() + "",
				this.getNome(),
				this.getCategoria(),
				this.getImagem(),
				this.getPreco() + "",
				this.getStatus(),
		};
		return(temp);
	}
	
	public void save() {
		if( this.getIdMaquina() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getIdMaquina() > 0 ) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public void loadById(int idMaquina) {
		String nome = "", categoria = "", imagem = "", preco = "", status = "";
		try {
			ResultSet resultSet = this.selectBy("idMaquina", ""+idMaquina);
			while (resultSet.next()) {
				nome 	  = resultSet.getString("nome");
				categoria = resultSet.getString("categoria"); 
				imagem = resultSet.getString("imagem");
				preco = resultSet.getString("preco");
				status	  = resultSet.getString("status");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setNome(nome);
		this.setCategoria(categoria);
		this.setImagem(imagem);
		this.setPreco(preco);
		this.setStatus(status);
	}
	
	public int getIdMaquina() {
		return idMaquina;
	}

	public void setIdMaquina(int idMaquina) {
		this.idMaquina = idMaquina;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getPreco() {
		return preco;
	}

	public void setPreco(String preco) {
		this.preco = preco;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
