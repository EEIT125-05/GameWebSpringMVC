package com.web.game.contest.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "gameList")
public class GameList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private String sGame;
	private String sSystem;
	
	public GameList() {
		super();
	}
	
	public GameList(Integer iNo, String sGame, String sSystem) {
		super();
		this.iNo = iNo;
		this.sGame = sGame;
		this.sSystem = sSystem;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsGame() {
		return sGame;
	}

	public void setsGame(String sGame) {
		this.sGame = sGame;
	}

	public String getsSystem() {
		return sSystem;
	}

	public void setsSystem(String sSystem) {
		this.sSystem = sSystem;
	}
}
