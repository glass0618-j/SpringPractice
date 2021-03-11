package kr.co.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private int cart_id;
	private int user_number;
	private int book_id;
	private int amount;
}
