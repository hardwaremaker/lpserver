<% response.setContentType("application/x-java-jnlp-file"); %>
 
<%@ page import="java.net.*,java.util.*" %>

<%
	String address = java.net.InetAddress.getLocalHost().getHostName() ;
	String theArguments = "" ;
	Map<String, String[]> parameters = request.getParameterMap();

	for(String parameter : parameters.keySet()) {
	if(parameter.startsWith("--")) {
		theArguments = theArguments + "<argument>" + parameter  ;
		String[] values = parameters.get(parameter);
		if(values != null && values.length > 0) {
			if(values[0].trim().length() > 0) {
				theArguments = theArguments + "=" + values[0].trim() ;
			}
		}
		theArguments = theArguments + "</argument>" ;
	}
}
%>


<?xml version="1.0" encoding="utf-8"?>
<jnlp
	spec="1.0+"
		codebase="http://<%= address %>:8080/helium-client/">

	<information>
		<title>HELIUM V Webstart Client</title>
		<vendor>HELIUM V IT Solutions GmbH</vendor>
		<homepage href="index.jsp"/>
		<description>HELIUM V Client Start</description>
		<icon href="lpclientpc.ico"/>
	</information>

	<security>
		<all-permissions/>
	</security>

	<resources>
<!-- 		<j2se version="1.6+" java-vm-args="-Xms128m -Xmx256m -XX:PermSize=64m -XX:MaxPermSize=256m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8989"/>  -->
		<j2se version="1.6+" java-vm-args="-XX:PermSize=64m -XX:MaxPermSize=512m"/>
        <property name="jnlp.java.naming.factory.initial" value="org.jnp.interfaces.NamingContextFactory" />
		<property name="jnlp.java.naming.provider.url" value="jnp://<%= address %>:2099" />
		
		<jar href="lpclientpc.jar" main="true" />
		<jar href="lib/log4j.jar" />
        <jar href="lib/asm.jar" />
        <jar href="lib/asm-attrs.jar" />
		<jar href="lib/barbecue-1.5-beta1.jar" />
		<jar href="lib/barcode4j-2.1.jar" />
		<jar href="lib/batik-anim.jar" />
		<jar href="lib/batik-awt-util.jar" />
		<jar href="lib/batik-bridge.jar" />
		<jar href="lib/batik-css.jar" />
		<jar href="lib/batik-dom.jar" />
		<jar href="lib/batik-ext.jar" />
		<jar href="lib/batik-gvt.jar" />
		<jar href="lib/batik-parser.jar" />
		<jar href="lib/batik-script.jar" />
		<jar href="lib/batik-svg-dom.jar" />
		<jar href="lib/batik-svggen.jar" />
		<jar href="lib/batik-util.jar" />
		<jar href="lib/batik-xml.jar" />
		<jar href="lib/cglib-2.1.3.jar" />
		<jar href="lib/commons-beanutils.jar" />
		<jar href="lib/commons-beanutils-bean-collections.jar" />
		<jar href="lib/commons-beanutils-core.jar" />
		<jar href="lib/commons-codec-1.6.jar" />
		<jar href="lib/commons-collections-3.1.jar" />
		<jar href="lib/commons-digester.jar" />
		<jar href="lib/commons-httpclient.jar" />
		<jar href="lib/commons-io-1.0.jar" />
		<jar href="lib/commons-lang-1.0.1.jar" />
		<jar href="lib/commons-logging.jar" />
		<jar href="lib/ejb3-persistence.jar" />
		<jar href="lib/grouplayout.jar" />
		<jar href="lib/iText-2.1.7.js2.jar" />
		<jar href="lib/jai_codec.jar" />
		<jar href="lib/jai_core.jar" />
		<jar href="lib/jasperreports-5.5.0.jar" />
		<jar href="lib/jasperreports-applet-5.5.0.jar" />
		<jar href="lib/jasperreports-fonts-5.5.0.jar" />
		<jar href="lib/jasperreports-javaflow-5.5.0.jar" />
		<jar href="lib/jbossall-client.jar" />
		<jar href="lib/jboss-ejb3x.jar" />
		<jar href="lib/jboss-j2ee.jar" />
		<jar href="lib/jboss-messaging-client.jar" />
		<jar href="lib/jcommon-1.0.16.jar" />
		<jar href="lib/jcr-1.0.jar" />
		<jar href="lib/jfreechart-1.0.13.jar" />
		<jar href="lib/jfreechart-1.0.13-experimental.jar" />
		<jar href="lib/jfreechart-1.0.13-swt.jar" />
		<jar href="lib/jhall.jar" />
		<jar href="lib/jtds-1.2.jar" /> 
		<jar href="lib/jxl.jar" />
		<jar href="lib/kunststoff.jar" />
		<jar href="lib/mail.jar" />
		<jar href="lib/miglayout-4.0-swing.jar"/>
		<jar href="lib/mstapisp.jar" />
		<jar href="lib/outldd.jar" />
		<jar href="lib/poi-3.9-20121203.jar" />
		<jar href="lib/poi-scratchpad-3.9-20121203.jar" />
		<jar href="lib/postgresql-8.1-405.jdbc3.jar" />
		<jar href="lib/RXTXcomm.jar" />
		<jar href="lib/servlet-api.jar"/>
		<jar href="lib/skinlf.jar" />
		<jar href="lib/swtgraphics2d.jar" />
		<jar href="lib/xml-apis.jar" />
		<jar href="lib/xml-apis-ext.jar" />
	</resources>

	<application-desc 
		name="HELIUM V Webstart Client"
		main-class="com.lp.client.pc.LPMain" 
		width="1024" 
		height="768" >
		<%= theArguments %>
	</application-desc>
</jnlp>
