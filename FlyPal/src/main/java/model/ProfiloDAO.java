package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProfiloDAO {

	public void doSave(Profilo p) {
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO PROFILO (USERNAME,NOME,COGNOME,DATANASC) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, p.getUsername());
			ps.setString(2, p.getNome());
			ps.setString(3, p.getCognome());
			ps.setString(4, p.getDatanasc());
			
			int i = ps.executeUpdate();
			if(i!=1)
				throw new RuntimeException();
			
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
