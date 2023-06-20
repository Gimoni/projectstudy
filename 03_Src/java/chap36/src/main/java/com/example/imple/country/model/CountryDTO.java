package com.example.imple.country.model;

import java.util.List;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.imple.city.model.City;
import com.example.standard.model.Modelable;
import com.example.standard.util.Continent;
import com.example.standard.util.Gender;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class CountryDTO implements Modelable<Country> {
	@NotNull
	@Length(max =3)
	String code;
	
	@NotBlank
	@Length(min= 1, max =52)
	String name;
	
	@Pattern(regexp ="Asia|Eruope|North America|Africa|Oceania|Antarctica|Sounth America|{0}" , message = "Asia|Eruope|NorthAmerica|Africa|Oceania|Antarctica|Sounth America| null만 허용됩니다." )
	String continent;
	
	@Length(max =26)
	String region;
	
	@Digits(integer=10, fraction =2)
	Double surfaceArea;
	
	@Range(max = 999999)
	Integer indepYear;
	
	@Range(max = 99999999999L)
	Long population;
	
	@Digits(integer=3, fraction =1)
	Double lifeExpectancy;
	
	@Digits(integer=10, fraction =2)
	Double gnp;
	
	@Digits(integer=10, fraction =2)
	Double gnpOld;
	
	@Length(max= 45)
	String localName;
	
	@Length(max= 45)
	String governmentForm;
	
	@Length(max= 60)
	String headOfState;
	
	@Range(max=99999999999L)
	Long capital;
	
	@Length(max=2)
	String code2;
	
//	List<City> citys;

	@Override
	public Country getModel() {
		Continent continent = null;
		if(!this.continent.equals(""))
			continent = Continent.valueOf(this.continent);
		
		return Country.builder()
					  .code(code)
					  .name(name)
					  .continent(continent)
					  .region(region)
					  .surfaceArea(surfaceArea)
					  .indepYear(indepYear)
					  .population(population)
					  .lifeExpectancy(lifeExpectancy)
					  .gnp(gnp)
					  .gnpOld(gnpOld)
					  .localName(localName)
					  .governmentForm(governmentForm)
					  .headOfState(headOfState)
					  .capital(capital)
					  .code2(code2)
					  .build();
	}
}
