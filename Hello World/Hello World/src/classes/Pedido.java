package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Pedido {
	private int	   	idPedido;
	private int 	idMaquina;
	private int 	idUsuario;
	private String 	dataInicial;
	private String  dataFinal;
	
	private String tableName	= "rentmach.pedidos"; 
	private String fieldsName	= "idPedido, idMaquina, idUsuario, dataInicial, dataFinal";  
	private String fieldKey		= "idPedido";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	public Pedido() {
		this.tableName = "rentmach.pedidos";
		this.fieldsName = "idPedido, idMaquina, idUsuario, dataInicial, dataFinal";  
		this.fieldKey = "idPedido";
		this.dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	}
	
	public String listAllOrders() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "";
		try {
				saida += "<h5 style=\"color: #FCB830; font-family: 'Quicksand', sans-serif; margin-top: 5px;\">Pedidos</h5>";
				saida += "<div id=\"orderTable\">";
					saida += "<table>";
						saida += "<thead>";
							saida += "<th>idPedido</th>";
							saida += "<th>idMaquina</th>";
							saida += "<th>idUsuario</th>";
							saida += "<th>Ações</th>";
						saida += "</thead>";
						saida += "<tbody>";
						while(rs.next()) {
								saida += "<tr>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"id\" value=\""+ rs.getString("idPedido") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"idMaquina\" value=\""+ rs.getString("idMaquina") +"\"></td>";
									saida += "<td><input style=\"max-width: 100px;\" type=\"text\" name=\"idUsuario\" value=\""+ rs.getString("idUsuario") +"\"></td>";
									saida += "<td style=\"max-height: 80px;height: 50px;\"><a href=\"delOrder.jsp?id="+ rs.getString("idPedido") + "\"><button type=\"submit\" style=\"margin-left: 5px;\" class=\"btn btn-danger\" ><img width=\"20px\" src=\"img/delIcon.png\" /></a></button></td>\n" + "";
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

	public Pedido(int idPedido, int idMaquina, int idUsuario, String dataInicial, String dataFinal) {
		this.tableName = "rentmach.pedidos";
		this.fieldsName = "idPedido, idMaquina, idUsuario, dataInicial, dataFinal";  
		this.fieldKey = "idPedido";
		this.dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
		
		this.setIdPedido(idPedido);
		this.setIdMaquina(idMaquina);
		this.setIdUsuario(idUsuario);
		this.setDataInicial(dataInicial);
		this.setDataFinal(dataFinal);
	}
	
	public String toString() {
		return(
				this.getIdPedido() + ""+" | "+
				this.getIdMaquina() + ""+" | "+
				this.getIdUsuario()+" | "+
				this.getDataInicial()+" | "+
				this.getDataFinal()+" | "
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdPedido() + "",
				this.getIdMaquina()+ "",
				this.getIdUsuario()+ "",
				this.getDataInicial() + "",
				this.getDataFinal(),
		};
		return(temp);
	}
	
	public void save() {
		if( this.getIdPedido() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getIdPedido() > 0 ) {
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
	
	public void loadById(int idPedido) {
		String dataInicial = "", dataFinal = "";
		try {
			ResultSet resultSet = this.selectBy("idPedido", ""+idPedido);
			while (resultSet.next()) {
				dataInicial  = resultSet.getString("dataInicial");
				dataFinal    = resultSet.getString("dataFinal");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setDataInicial(dataInicial);
		this.setDataFinal(dataFinal);
	}
	
	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getIdMaquina() {
		return idMaquina;
	}

	public void setIdMaquina(int idMaquina) {
		this.idMaquina = idMaquina;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(String dataInicial) {
		this.dataInicial = dataInicial;
	}

	public String getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(String dataFinal) {
		this.dataFinal = dataFinal;
	}
	

}
