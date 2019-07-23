package com.spring.biz.vo;


// 아이템_옵션_테이블 
public class OptionsVO {

	    // 옵션_코드 
	    private int optionsCode;
	    // 아이템_코드 
	    private int itemCode;
	    // 옵션_1 
	    private String options01;
	    // 옵션_2 
	    private String options02;
	    // 옵션_3 
	    private String options03;
	    // 옵션_4 
	    private String options04;
	    // 옵션_5 
	    private String options05;
	    //NVL 아이템 코드
		private int nvlItemCode;
		//NVL 옵션 코드
		private int nvlOptionsCode;

	    public int getOptionsCode() {
	        return optionsCode;
	    }

	    public void setOptionsCode(int optionsCode) {
	        this.optionsCode = optionsCode;
	    }

	    public int getItemCode() {
	        return itemCode;
	    }

	    public void setItemCode(int itemCode) {
	        this.itemCode = itemCode;
	    }

	    public String getOptions01() {
	        return options01;
	    }

	    public void setOptions01(String options01) {
	        this.options01 = options01;
	    }

	    public String getOptions02() {
	        return options02;
	    }

	    public void setOptions02(String options02) {
	        this.options02 = options02;
	    }

	    public String getOptions03() {
	        return options03;
	    }

	    public void setOptions03(String options03) {
	        this.options03 = options03;
	    }

	    public String getOptions04() {
	        return options04;
	    }

	    public void setOptions04(String options04) {
	        this.options04 = options04;
	    }

	    public String getOptions05() {
	        return options05;
	    }

	    public void setOptions05(String options05) {
	        this.options05 = options05;
	    }

		public int getNvlItemCode() {
			return nvlItemCode;
		}

		public void setNvlItemCode(int nvlItemCode) {
			this.nvlItemCode = nvlItemCode;
		}

		public int getNvlOptionsCode() {
			return nvlOptionsCode;
		}

		public void setNvlOptionsCode(int nvlOptionsCode) {
			this.nvlOptionsCode = nvlOptionsCode;
		}

		@Override
		public String toString() {
			return "OptionsVO [optionsCode=" + optionsCode + ", itemCode=" + itemCode + ", options01=" + options01
					+ ", options02=" + options02 + ", options03=" + options03 + ", options04=" + options04
					+ ", options05=" + options05 + "]";
		}
	    
	    
}
