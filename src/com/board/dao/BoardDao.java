package com.board.dao;

import java.util.ArrayList;
import java.sql.*;

import com.board.beans.Board;

public class BoardDao extends CommonDao {
	public static BoardDao getInstance() {
		BoardDao _instance = new BoardDao();
		_instance.SetDB();
		return _instance;
	}

	
	@SuppressWarnings("unchecked")
	public ArrayList<Board> getArticleList() throws SQLException {
		ArrayList<Board> articleList = null;
	    articleList = (ArrayList<Board>)GetDB().queryForList("getArticleList", null);
	    return articleList;
	}
}
