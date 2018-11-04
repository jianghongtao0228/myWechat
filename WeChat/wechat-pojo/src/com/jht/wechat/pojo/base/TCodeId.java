package com.jht.wechat.pojo.base;

public class TCodeId implements java.io.Serializable {

	private static final long serialVersionUID = -1335811565859322614L;

	private String CPid;

	private String CCode;

	/** default constructor */
	public TCodeId() {
	}

	/** full constructor */
	public TCodeId(String CPid, String CCode) {
		this.CPid = CPid;
		this.CCode = CCode;
	}

	public String getCPid() {
		return CPid;
	}

	public void setCPid(String CPid) {
		this.CPid = CPid;
	}

	public String getCCode() {
		return CCode;
	}

	public void setCCode(String CCode) {
		this.CCode = CCode;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CCode == null) ? 0 : CCode.hashCode());
		result = prime * result + ((CPid == null) ? 0 : CPid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj){
			return true;
		}
		if (obj == null){
			return false;
		}
		if (getClass() != obj.getClass()){
			return false;
		}
		TCodeId other = (TCodeId) obj;
		if (CCode == null) {
			if (other.CCode != null){
				return false;
			}
		} else if (!CCode.equals(other.CCode)){
			return false;
		}
		if (CPid == null) {
			if (other.CPid != null){
				return false;
			}
		} else if (!CPid.equals(other.CPid)){
			return false;
		}
		return true;
	}
}
