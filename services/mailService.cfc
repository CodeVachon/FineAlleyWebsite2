/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/services/mailService.cfc
* @author  Christopher Vachon	
* @description	Used for sending emails
*
*/

component output="false" displayname="mailService" extends="object" {

	public void function sendEmail(required string content, string subject = "Website Message", string toAddress = "info@christophervachon.com") {
		var mail = new mail();
		mail.setSubject(ARGUMENTS.subject);
		mail.setTo(ARGUMENTS.toAddress);

		mail.setFrom( "Fine Alley Website <no-reply@finealley.com>" );
		mail.setType("HTML");

		if (structKeyExists(ARGUMENTS,"SMTPServer")) { mail.setSever(ARGUMENTS["SMTPServer"]); }
		if (structKeyExists(ARGUMENTS,"SMTPPort")) { mail.setPort(ARGUMENTS["SMTPPort"]); }
		if (structKeyExists(ARGUMENTS,"SMTPUsername")) { mail.setUsername(ARGUMENTS["SMTPUsername"]); }
		if (structKeyExists(ARGUMENTS,"SMTPPassword")) { mail.setPassword(ARGUMENTS["SMTPPassword"]); }
		if (structKeyExists(ARGUMENTS,"SMTPuseSSL")) { mail.setUseSSL(ARGUMENTS["SMTPuseSSL"]); }

		try {
			mail.send(body=ARGUMENTS.content);
		} catch (any e) {
			writeDump(e);
			abort;

			throw(message="Failed to Send Message");
		}
	}


	public struct function validateContactUsFormAndSend() {
		var validationErrors = {};

		if (!structKeyExists(ARGUMENTS,"firstName") || (len(trim(ARGUMENTS.firstName)) == 0)) {
			validationErrors.firstName = "Please enter your First Name";
		}
		if (!structKeyExists(ARGUMENTS,"lastName") || (len(trim(ARGUMENTS.lastName)) == 0)) {
			validationErrors.lastName = "Please enter your Last Name";
		}
		if (!structKeyExists(ARGUMENTS,"emailAddress") || (len(trim(ARGUMENTS.emailAddress)) == 0)) {
			validationErrors.emailAddress = "Please enter an Email Address to contact you at";
		}

		if (!structKeyExists(ARGUMENTS,"subject") || (len(trim(ARGUMENTS.subject)) == 0)) {
			validationErrors.subject = "Please enter a Subject";
		}
		if (!structKeyExists(ARGUMENTS,"body") || (len(trim(reReplace(ARGUMENTS.body,"<[^>]+>","","all"))) == 0)) {
			validationErrors.body = "Please enter a Message";
		}

		if (structIsEmpty(validationErrors)) {
			if (!structKeyExists(ARGUMENTS,"phoneNumber") || (len(trim(ARGUMENTS.phoneNumber)) == 0)) {
				ARGUMENTS.phoneNumber = "Not Provided";
			}
			var messageBody = "
				<h1>Website Message</h1>
				<p>
					From: #ARGUMENTS.firstName# #ARGUMENTS.lastName# [<a href='mailto:#ARGUMENTS.emailAddress#'>#ARGUMENTS.emailAddress#</a>]<br/>
					Phone: #ARGUMENTS.phoneNumber#<br />
				</p>
				#ARGUMENTS.body#
			";
			this.sendEmail(messageBody,ARGUMENTS.subject);
		}

		return validationErrors;
	}
}