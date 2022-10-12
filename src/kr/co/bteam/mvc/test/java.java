package kr.co.bteam.mvc.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.parser.ParseException;

public class java {
public static void main(String[] args) throws IOException, ParseException {
		
		String apiUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
		// Ȩ���������� ���� Ű
		String serviceKey = "�޾ƿ� Ű�� �Է�";
		String nx = "37";	//����
		String ny = "126";	//�浵
		String baseDate = "20190607";	//��ȸ�ϰ���� ��¥
		String baseTime = "1100";	//��ȸ�ϰ���� �ð�
		String type = "json";	//Ÿ�� xml, json ��� ..
		
		
        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //�浵
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //����
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* ��ȸ�ϰ���� ��¥*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* ��ȸ�ϰ���� �ð� AM 02�ú��� 3�ð� ���� */
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* Ÿ�� */
        
        /*
         * GET������� �����ؼ� �Ķ���� �޾ƿ���
         */
        URL url = new URL(urlBuilder.toString());
        //��� �Ѿ���� Ȯ���ϰ� ������ �Ʒ� ��º� �ּ� ����
        //System.out.println(url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result= sb.toString();
        System.out.println(result);
        

        /*
         * POP	����Ȯ��	 %
         * PTY	��������	�ڵ尪
         * R06	6�ð� ������	���� (1 mm)
         * REH	����	 %
         * S06	6�ð� ������	����(1 cm)
         * SKY	�ϴû���	�ڵ尪
         * T3H	3�ð� ���	 ��
         * TMN	��ħ �������	 ��
         * TMX	�� �ְ���	 ��
         * UUU	ǳ��(��������)	 m/s
         * VVV	ǳ��(���ϼ���)	 m/s
         */
	        
	        
	        
    }
}
