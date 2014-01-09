component extends="frameworkOne.framework" {
	this.name = 'FineAlleyWebsiteVr1.0';
	this.sessionManagement = true;
	this.sessionTimeout = CreateTimespan(0,0,20,0);


	this.datasource = "FineAlley";
	this.ormEnabled = true;
	this.ormSettings = {
		dbcreate = ((this.getEnvironment() == "dev")?"update":"none"),
		eventHandling = true,
		cfclocation = 'models',
		flushatrequestend = false,
		namingstrategy = "smart",
		dialect = "MySQL"
	};


	VARIABLES.framework = {
		defaultSection = 'home', defaultItem = 'default',
		error = 'home.error',
		generateSES = true,
		SESOmitIndex = true,
		applicationKey = 'frameworkOne',
		routes = [
		]
	};


	VARIABLES.framework.environments = {
		dev = {
			reload = 'reload',
			password = 'true',
			reloadApplicationOnEveryRequest = true
		},
		live = {
			reload = 'arma-iterum',
			password = 'onere',
			reloadApplicationOnEveryRequest = false
		}
	};


	public string function getEnvironment() {
		if (reFindNoCase("\.(local)$",CGI.SERVER_NAME) > 0) {
			return "dev";
		} else {
			return "live";
		}
	}


	public void function setupRequest() {
		if (isFrameworkReloadRequest()) {
			ORMClearSession();
			ORMReload();
		}

		REQUEST.template = new services.template();
		REQUEST.template.setSiteName("Fine Alley");
		REQUEST.template.addFile('http://code.jquery.com/jquery-1.10.1.min.js');
		REQUEST.template.addFile('/includes/css/FineAlleyWebsite.min.css');

		REQUEST.template.addMetaTag(property="fb:app_id",content="272812729524274");
		REQUEST.template.addMetaTag(property="og:url",content="http://www.finealley.com#buildUrl(getSectionAndItem())#");
		REQUEST.template.addMetaTag(property="og:site_name",content="Fine Alley");
		REQUEST.template.addMetaTag(property="og:type",content="website");
		REQUEST.template.addMetaTag(property="og:locale",content="en_US");
		REQUEST.template.addMetaTag(property="og:image",content="http://www.finealley.com/includes/img/finealleySplash1500.jpg");
	}


	public string function onMissingView( struct rc ) {
		REQUEST.template.setPageTitle("404");
		return view('home/error404');
	}
}