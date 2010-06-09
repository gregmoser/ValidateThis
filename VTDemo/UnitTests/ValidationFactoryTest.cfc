<!---
	// **************************************** LICENSE INFO **************************************** \\
	
	Copyright 2008, Bob Silverberg
	
	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in 
	compliance with the License.  You may obtain a copy of the License at 
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software distributed under the License is 
	distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
	implied.  See the License for the specific language governing permissions and limitations under the 
	License.
	
--->
<cfcomponent extends="UnitTests.BaseTestCase" output="false">
	
	<cffunction name="setUp" access="public" returntype="void">
		<cfscript>
			// Deafult values copied from ValidateThis.cfc
			ValidateThisConfig = {};
			ValidateThisConfig.TranslatorPath="ValidateThis.core.BaseTranslator";
			ValidateThisConfig.LocaleLoaderPath="ValidateThis.core.BaseLocaleLoader";
			ValidateThisConfig.BOValidatorPath="ValidateThis.core.BOValidator";
			ValidateThisConfig.DefaultJSLib="jQuery";
			ValidateThisConfig.JSRoot="js/";
			ValidateThisConfig.defaultFormName="frmMain";
			ValidateThisConfig.definitionPath="/model/";
			ValidateThisConfig.localeMap="#StructNew()#";
			ValidateThisConfig.defaultLocale="en_US";
			ValidateThisConfig.abstractGetterMethod="";
			ValidateThisConfig.ExtraRuleValidatorComponentPaths="";
			ValidateThisConfig.ResultPath="ValidateThis.util.Result";
		</cfscript>
	</cffunction>
	
	<cffunction name="newResultShouldReturnBuiltInResultObjectWithDefaultConfig" access="public" returntype="void">
		<cfscript>
			validationFactory = CreateObject("component","ValidateThis.core.ValidationFactory").init(ValidateThisConfig);
			result = validationFactory.newResult();
			assertEquals("validatethis.util.Result",GetMetadata(result).name);
		</cfscript>
	</cffunction>

	<cffunction name="newResultShouldReturnCustomResultObjectWhenspecifiedViaConfig" access="public" returntype="void">
		<cfscript>
			ValidateThisConfig.ResultPath="UnitTests.Fixture.APlainCFC_Fixture";
			validationFactory = CreateObject("component","ValidateThis.core.ValidationFactory").init(ValidateThisConfig);
			result = validationFactory.newResult();
			assertEquals("UnitTests.Fixture.APlainCFC_Fixture",GetMetadata(result).name);
		</cfscript>
	</cffunction>

</cfcomponent>

