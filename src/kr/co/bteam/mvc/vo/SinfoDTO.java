package kr.co.bteam.mvc.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SinfoDTO {
	private int inum, iprice, istoke;
	private String snum, iname, imgn;
	private MultipartFile mfile;
}
