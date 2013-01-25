
<cfcomponent name="studentsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="studentsService">
		<cfargument name="studentsDAO" type="studentsDAO" required="true" />
		<cfargument name="studentsGateway" type="studentsGateway" required="true" />

		<cfset variables.studentsDAO = arguments.studentsDAO />
		<cfset variables.studentsGateway = arguments.studentsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createstudents" access="public" output="false" returntype="students">
		<cfargument name="ID" type="numeric" required="true" />
		<cfargument name="FullName" type="string" required="false" />
		
			
		<cfset var students = createObject("component","students").init(argumentCollection=arguments) />
		<cfreturn students />
	</cffunction>

	<cffunction name="getstudents" access="public" output="false" returntype="students">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var students = createstudents(argumentCollection=arguments) />
		<cfset variables.studentsDAO.read(students) />
		<cfreturn students />
	</cffunction>


	<cffunction name="getStudentsQuery" access="public" output="false" returntype="query">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="FullName" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfreturn variables.studentsGateway.getByAttributesQuery(argumentCollection=arguments) />
	</cffunction>



	<cffunction name="getstudentss" access="public" output="false" returntype="array">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="FullName" type="string" required="false" />
		
		<cfreturn variables.studentsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savestudents" access="public" output="false" returntype="boolean">
		<cfargument name="students" type="students" required="true" />

		<cfreturn variables.studentsDAO.save(students) />
	</cffunction>

	<cffunction name="deletestudents" access="public" output="false" returntype="boolean">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var students = createstudents(argumentCollection=arguments) />
		<cfreturn variables.studentsDAO.delete(students) />
	</cffunction>
</cfcomponent>
