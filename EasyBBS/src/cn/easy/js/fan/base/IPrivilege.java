package cn.easy.js.fan.base;

import javax.servlet.http.HttpServletRequest;

public interface IPrivilege {
	public static final String MSG_INVALID = "�Բ�������Ȩ���ʣ�";

	public abstract boolean isValid(HttpServletRequest paramHttpServletRequest,
			String paramString);

	public abstract String getUser(HttpServletRequest paramHttpServletRequest);
}
