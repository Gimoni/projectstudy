package com.example.imple.user.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderTest {

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Test
	void encoder() {
		var encodeStr = encoder.encode("1234");
		System.out.println(encodeStr);
	}
	//$2a$10$ayg93l/BuyOQ0b/1huGiJuBXm71M9fELCMt4OZ0da1bEX2mweIbcm
	//$2a$10$nOMTH4OzkBYs1u1L2B5K5.SNO257rvxJH7cAd4Rykebfv5NRwfSi.
	//$2a$10$R5pyyAZm6eTJPVvFHwli8OPhYT11QBdWzHpWY/nfn.LSZDtYHgfPm
	
	@Test
	void match() {
		var success = encoder.matches("1234", "$2a$10$ayg93l/BuyOQ0b/1huGiJuBXm71M9fELCMt4OZ0da1bEX2mweIbcm");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		success = encoder.matches("1234", "$2a$10$nOMTH4OzkBYs1u1L2B5K5.SNO257rvxJH7cAd4Rykebfv5NRwfSi.");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		success = encoder.matches("1234", "$2a$10$R5pyyAZm6eTJPVvFHwli8OPhYT11QBdWzHpWY/nfn.LSZDtYHgfPm");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		
		success = encoder.matches("1234", "1234");
		System.out.println(success);
		assertThat(success).isEqualTo(false);
	}
}
