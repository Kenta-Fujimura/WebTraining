package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Mutter;

public class MutterDAO {
	private Connection db; //todoappデータベースに接続されたコネクション
	private PreparedStatement ps; //sql文を保持する変数
	private ResultSet rs; //結果セット(SQL文を実行した結果の集合)を保持

	//接続処理
	private void connect() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/jsp");
		db = ds.getConnection();
	}

	//切断処理
	private void disconnect() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (db != null) {
				db.close();
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	}

	public List<Mutter> findAll() {
		List<Mutter> mutterlist = new ArrayList<>();
		try {
			this.connect();
			ps = db.prepareStatement("SELECT * FROM MUTTER ORDER BY ID DESC");
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String userName = rs.getString("userName");
				String text = rs.getString("text");
				//list.add(new Todo(id, title, importance));
				Mutter mutter=new Mutter(id,userName,text);
				mutterlist.add(mutter);
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			this.disconnect();
		}
		return mutterlist;
	}

	public void create(Mutter mutter) {
		try {
			this.connect();
			ps = db.prepareStatement("INSERT INTO MUTTER(NAME,TEXT) VALUES(?,?)");
			ps.setString(1, mutter.getUserName());
			ps.setString(2, mutter.getText());
			ps.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			this.disconnect();
		}
	}

}
