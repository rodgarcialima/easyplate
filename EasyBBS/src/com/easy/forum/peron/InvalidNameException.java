package com.easy.forum.peron;

public class InvalidNameException extends Exception {
	public InvalidNameException(){
		super("���û�������!");
	}
	public InvalidNameException(String msg){
		super(msg);
	}

}
