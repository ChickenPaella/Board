package com.board.dao;

import java.util.ArrayList;
import java.sql.*;

import com.board.beans.Board;

public class BoardDao extends CommonDao {
	public static BoardDao getInstance() {
		BoardDao _instance = new BoardDao();
		return _instance;
	}

	public ArrayList<Board> getArticleList() throws SQLException {
			ResultSet rs = null;
			String sql = "select * from board order by idx desc";
			rs = openConnection().executeQuery(sql);
			

			ArrayList<Board> articleList = new ArrayList<Board>();

			while (rs.next()) {
				Board article = new Board();

				article.setIdx(rs.getInt("idx"));
				article.setTitle(rs.getString("title"));
				article.setWriter(rs.getString("writer"));
				article.setRegdate(rs.getString("regdate"));

				articleList.add(article); // 셋팅된 빈을 리스트에 추가합니다.
			}
			
			closeConnection();
			
			return articleList;

		

	}
}
