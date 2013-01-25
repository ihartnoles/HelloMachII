
<cfcomponent displayname="students" output="false">
		<cfproperty name="ID" type="numeric" default="" />
		<cfproperty name="FullName" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="students" output="false">
		<cfargument name="ID" type="string" required="false" default="" />
		<cfargument name="FullName" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setID(arguments.ID) />
		<cfset setFullName(arguments.FullName) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="students" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- ID --->
		<cfif (len(trim(getID())) AND NOT isNumeric(trim(getID())))>
			<cfset thisError.field = "ID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FullName --->
		<cfif (len(trim(getFullName())) AND NOT IsSimpleValue(trim(getFullName())))>
			<cfset thisError.field = "FullName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FullName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFullName())) GT 50)>
			<cfset thisError.field = "FullName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FullName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setID" access="public" returntype="void" output="false">
		<cfargument name="ID" type="string" required="true" />
		<cfset variables.instance.ID = arguments.ID />
	</cffunction>
	<cffunction name="getID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ID />
	</cffunction>

	<cffunction name="setFullName" access="public" returntype="void" output="false">
		<cfargument name="FullName" type="string" required="true" />
		<cfset variables.instance.FullName = arguments.FullName />
	</cffunction>
	<cffunction name="getFullName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FullName />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
