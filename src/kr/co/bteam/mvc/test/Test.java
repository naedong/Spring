package kr.co.bteam.mvc.test;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class Test {
	public static void main(String[] args) throws IOException, ParseException {
		
		String apiUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
		// Ȩ���������� ���� Ű
		String serviceKey = "Ű ��";
		String nx = "37";	//����
		String ny = "126";	//�浵
		String baseDate = "20190611";	//��ȸ�ϰ���� ��¥ �� ������ ���� ��¥ �Է��� �ָ� ��
		String baseTime = "2300";	//API ���� �ð��� �Է��ϸ� ��
		String type = "json";	//Ÿ�� xml, json ��� ..
		String numOfRows = "153";	//�� ������ ��� �� 
		
		//���� 23�� ���� 153���� �����͸� ��ȸ�ϸ� ���ð� ������ ������ �� �� ����
		
		
		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //�浵
		urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //����
		urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* ��ȸ�ϰ���� ��¥*/
		urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* ��ȸ�ϰ���� �ð� AM 02�ú��� 3�ð� ���� */
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* Ÿ�� */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));	/* �� ������ ��� �� */
		
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
		
		
		// Json parser�� ����� ������� ���ڿ� �����͸� ��üȭ 
		JSONParser parser = new JSONParser(); 
		JSONObject obj = (JSONObject) parser.parse(result); 
		// response Ű�� ������ �����͸� �Ľ� 
		JSONObject parse_response = (JSONObject) obj.get("response"); 
		// response �� ���� body ã��
		JSONObject parse_body = (JSONObject) parse_response.get("body"); 
		// body �� ���� items ã�� 
		JSONObject parse_items = (JSONObject) parse_body.get("items");

		// items�� ���� itemlist �� �ޱ� 
		JSONArray parse_item = (JSONArray) parse_items.get("item");
		String category;
		JSONObject weather; // parse_item�� �迭�����̱� ������ �ϳ��� �����͸� �ϳ��� �����ö� ���
		// ī�װ��� ���� �޾ƿ���
		String day="";
		String time="";
		for(int i = 0 ; i < parse_item.size(); i++) {
			weather = (JSONObject) parse_item.get(i);
			Object fcstValue = weather.get("fcstValue");
			Object fcstDate = weather.get("fcstDate");
			Object fcstTime = weather.get("fcstTime");
			//double������ �ް������ �Ʒ����� �ּ� ����
			//double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
			category = (String)weather.get("category"); 
			// ���
			if(!day.equals(fcstDate.toString())) {
				day=fcstDate.toString();
			}
			if(!time.equals(fcstTime.toString())) {
				time=fcstTime.toString();
				System.out.println(day+"  "+time);
			}
			System.out.print("\tcategory : "+ category);
			System.out.print(", fcst_Value : "+ fcstValue);
			System.out.print(", fcstDate : "+ fcstDate);
			System.out.println(", fcstTime : "+ fcstTime);
		}

		/*
		 * �׸�	�׸��	����
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
		 * WAV	�İ�	 M
		 * VEC	ǳ��	 m/s
		 * WSD	ǳ��	1

		 */
			
			
			
	}
}
