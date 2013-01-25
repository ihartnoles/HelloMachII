<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN"  "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="byName">
	
	<!--
	<import resource="/intfroot/config/coldspring/aicServices.xml.cfm" />
 	<import resource="/intfroot/config/coldspring/surveyServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/showcaseServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/receiverServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/apiServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/customFormServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/superServices.xml.cfm" />
	<import resource="/intfroot/portfolio/config/services.xml.cfm" />
	-->

	
<!-- lookup -->
	<bean id="studentsDAO" class="HelloMachII.model.studentsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="studentsGateway" class="HelloMachII.model.studentsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="studentsService" class="HelloMachII.model.studentsService">
		<constructor-arg name="studentsDAO">
			<ref bean="studentsDAO"/>
		</constructor-arg>
		<constructor-arg name="studentsGateway">
			<ref bean="studentsGateway"/>
		</constructor-arg>
	</bean>

</beans>