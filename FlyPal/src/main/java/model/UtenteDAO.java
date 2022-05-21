package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteDAO {
	
	public void doSave(Utente u) {
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO flypal.utente VALUES (? ? ? ? ?)");
			int admin = 0;
			
			if(u.isAdmin()==1)
				admin = 1;
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getHashPassword());
			ps.setInt(4, admin);
			ps.setString(5, u.getSalt());
			
			if (ps.executeUpdate() != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
