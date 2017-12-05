package com.SWJTHC.model;

import java.sql.Date;
import java.util.List;

import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.Title;

public class PersonalInfo {
	private String username;
	private String name;
	private String sex;
	private String ethnic;
	private Date bornDate;
	private Date inWorkDate;
	private Date inArmyDate;
	private Date inPartyDate;
	private String origin;
	private String birthPlace;
	private Title title;
	private String work;
	private String healthCondition;
	private String fullTimeEdu;
	private String onTheJobEdu;
	private String fullTimeSchool;
	private String onTheJobSchool;
	private String currentPosition;
	private String policeRank;
	private Date policeRankDate;
	private PositionLevel positionLevel;
	private Date positionLevelDate;
	private String resume;
	private String teachingSituation;
	private String rewards;
	
	public PersonalInfo(){
		
	}
}
