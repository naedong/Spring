package kr.co.bteam.mvc.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ExpectShopDTO {
	private String snum, sname, sloc, scate, ploc;
	private int pcnt, avg, expect;
}
