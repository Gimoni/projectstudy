package com.example.imple.salgrade.model;

import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName="of")
@NoArgsConstructor
@Builder
public class SalgradeDTO implements Modelable<Salgrade> {
	@NonNull 
	@Range(min =1, max=5)
	Integer grade;
	
	@Range(min =100, max=800)
	Integer losal;
	
	@Range(min =100, max=9999)
	Integer hisal;

	@Override
	public Salgrade getModel() {
		return Salgrade.builder()
					   .grade(grade)
					   .losal(losal)
					   .hisal(hisal)
					   .build();
	}
}