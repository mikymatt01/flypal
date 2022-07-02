package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AgenziaDAO {
	
	public void doSave(Agenzia a) {
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("inser into agenzia (username, piva, nome, sede) values (?, ?, ?, ?",Statement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, a.getUsername());
			ps.setString(2, a.getPiva());
			ps.setString(3, a.getNome());
			ps.setString(4, a.getSede());
			
			int i = ps.executeUpdate();
			if(i!=1)
				throw new RuntimeException();
			
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
