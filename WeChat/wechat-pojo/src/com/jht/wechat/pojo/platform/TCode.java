package com.jht.wechat.pojo.platform;

import com.jht.wechat.pojo.base.TCodeId;

/**
 * @author jht
 */
public class TCode implements java.io.Serializable {

	private static final long serialVersionUID = 5794467642449083484L;

	/**
	 * 复合主键
	 */
	private TCodeId id;

	/**
	 * 名称
	 */
	private String CName;

	/**
	 * 是否有效
	 */
	private Integer NValid;

	/**
	 * 排序
	 */
	private Integer NOrder;

	/**
	 * 代码简拼
	 */
	private String CDmjp;

	public TCodeId getId() {
		return id;
	}

	public void setId(TCodeId id) {
		this.id = id;
	}

	public String getCName() {
		return CName;
	}

	public void setCName(String CName) {
		this.CName = CName;
	}

	public Integer getNValid() {
		return NValid;
	}

	public void setNValid(Integer NValid) {
		this.NValid = NValid;
	}

	public Integer getNOrder() {
		return NOrder;
	}

	public void setNOrder(Integer NOrder) {
		this.NOrder = NOrder;
	}

	public String getCDmjp() {
		return CDmjp;
	}

	public void setCDmjp(String CDmjp) {
		this.CDmjp = CDmjp;
	}
}
