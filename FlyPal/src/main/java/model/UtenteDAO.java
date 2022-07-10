package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UtenteDAO {
	
	public boolean doSave(Utente u) {
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO UTENTE (USERNAME,EMAIL,PASSWORD,ADMIN,SALT) VALUES (?, ?, ?, ?, ?)",Statement.RETURN_GENERATED_KEYS);
			int admin = 0;
			
			if(u.isAdmin()==true)
				admin = 1;
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getHashPassword());
			ps.setInt(4, admin);
			ps.setString(5, u.getSalt());
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
}
