package com.SWJTHC.Dao;

import java.util.Comparator;

import com.SWJTHC.model.UserAchievement;

public class IndivComparator implements Comparator {  
    public int compare(Object object1, Object object2) {// ʵ�ֽӿ��еķ���  
    	UserAchievement p1 = (UserAchievement) object1; // ǿ��ת��  
    	UserAchievement p2 = (UserAchievement) object2;  
        return new Double(p2.getScore()).compareTo(new Double(p1.getScore()));  
    }  
}  
