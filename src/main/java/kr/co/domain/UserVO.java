package kr.co.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	private int user_number;
    private String user_id;
    private String user_pw;
    private String user_name;
    private int user_hp1;
    private int user_hp2;
    private int user_hp3;
    private String user_email;
    private String user_zipcode;
    private String user_roadAddress;
    private String user_jibunAddress;
    private String user_namujiAddress;
    private String user_birthY;
    private String user_birthM;
    private String user_birthD;
    private Date user_joinDate;
    private int user_del_yn;
}
