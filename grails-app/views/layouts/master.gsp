<%--
  Created by IntelliJ IDEA.
  User: abhilash
  Date: 13/4/17
  Time: 11:19 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <asset:stylesheet src="commonBundle.css" />
    <asset:javascript src="commonBundle.js" />
    <link href="${resource(dir: "css", file: 'font-awesome.min.css')}" rel="stylesheet"/>
    <g:layoutHead/>
</head>

<body>
<input type="hidden" value="${request.scheme}://${request.serverName}:${request.serverPort}${request.getContextPath()} " id="hdnBaseUrl"/>
<g:layoutBody/>
</body>
</html>