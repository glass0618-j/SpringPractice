package kr.co.domain;


import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserVO {
	private int user_number;
	
	@Size(min=4, max=16)
	@Pattern(regexp = "[a-z0-9]*", message="영문 소문자,숫자 4-16자")
    private String user_id;
    
	@Size(min=4, max=16)
	@Pattern(regexp = "[a-zA-Z0-9]*", message="영문 대소문자,숫자4-16자")
    private String user_pw;
	private String user_pw2;
	
	@Size(min=2, max=20)
    @Pattern(regexp = "[가-힣]*", message="한글만가능" )
    private String user_name;
	
    private String user_hp1;
    private String user_hp2;
    private String user_hp3;
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
