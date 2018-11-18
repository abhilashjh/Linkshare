<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Nexthoughts::Link Sharing</title>
    <asset:stylesheet src="commonBundle.css" />
    <asset:javascript src="commonBundle.js" />
    <link href="${resource(dir: "css", file: 'font-awesome.min.css')}" rel="stylesheet"/>
    <link href="${resource(dir: "css", file: 'login.css')}" rel="stylesheet"/>
    <g:javascript src="login.js"/>
    <script type="text/javascript">
        $(document).ready(function () {
            var d = new Date();
            $('#spnDate').text(d.getFullYear());
        });
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body style="background-color: #CCCCCC">

<input type="hidden" value="${request.scheme}://${request.serverName}:${request.serverPort}${request.getContextPath()} " id="hdnBaseUrl"/>

<header class="pageHeader">
    <div class="container">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <img id="imgLogo" src="${createLinkTo(dir: 'images', file: 'logo.png')}" alt="cannot load logo"/>
        </div>

        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-12 col-xs-12">
            <h2 id="title" style="color: #2b669a">Link Sharing</h2>
        </div>

        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

            <div class="socialIcons">
                <g:link class="facebook fa-stack" target="_blank" uri="${grailsApplication.config.social.facebook}">
                    <span class="fa fa-circle fa-stack-2x"></span>
                    <span class="fa fa-facebook fa-stack-1x"></span>
                </g:link>
                <g:link class="linkedin fa-stack" target="_blank" uri="${grailsApplication.config.social.linkedIn}">
                    <span class="fa fa-circle fa-stack-2x"></span>
                    <span class="fa fa-linkedin fa-stack-1x"></span>
                </g:link>
            </div>

            <div class="search input-group">
                <g:textField class="form-control" id="txtSearch" name="search" placeholder="Search"/>
                <span class="input-group-addon">
                    <i class="fa fa-search"></i>
                </span>
            </div>

        </div>
    </div>
</header>


<div class="container loginBody">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="float: right; margin-top: 10px">
            <form action="${createLink(uri: '/j_spring_security_check')}" method="post" style="float: left; width: 90%">
                <div class="loginForm col-lg-12 col-md-12">
                    <div class="loginFormTitle">
                        Login
                    </div>

                    <div class="loginFormBody">
                        <div id="divLogin">
                            <div class='login_message col-md-12'>${flash.message}</div>
                            <span class="col-md-5"><label id="lblLoginUsername"
                                                          for="txtLoginUsername">Email/Username</label></span>
                            <span class="col-md-7">
                                <g:textField id="txtLoginUsername" title="Click to enter Email/Username"
                                             placeholder="Email/Username" errorMessage="Please enter your Email/Username"
                                             maxlength="100" class="form-control" name="j_username" mandatory="1"/></span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px"><label id="lblLoginPassword"
                                                                                  for="txtLoginPassword">Password</label>
                            </span>
                            <span class="col-md-7">
                                <g:passwordField name="j_password" id="txtLoginPassword" title="Click to enter Password"
                                                 placeholder="Password" errorMessage="Please enter your Password"
                                                 class="form-control" mandatory="1"/></span>

                            <div class="clearfix"></div>
                        </div>

                        <div style="margin-top: 3px">
                            <span class="pull-left" style="margin-top: 7px; margin-left: 15px;">
                                <a href="#" style="text-decoration: none; color:#2b669a">Forgot Password</a></span>
                            <input id="btnLogin" value="Login" type="submit" style="margin-right: 17px; width: 100px"
                                   class="btn btn-primary pull-right" onclick="javascript:return validateLogin()"/>
                        </div>
                    </div>
                </div>

            </form>

            <form method="Post" style="float: left; width: 90%;">
                <div class="loginForm col-lg-12 col-md-12">
                    <div class="loginFormTitle">
                        Register
                    </div>

                    <div class="loginFormBody" style="height: 370px; margin-bottom: 10px">
                        <div id="divRegister">
                            <span class="col-md-5">
                                <label id="lblFirstName" for="txtFirstName">First Name</label>
                            </span>
                            <span class="col-md-7">
                                <g:textField id="txtFirstName" title="Click to enter First Name"
                                             placeholder="First Name" name="firstName" errorMessage="Please enter First Name"
                                             maxlength="100" class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblLastName" for="txtLastName">Last Name</label>
                            </span>
                            <span class="col-md-7">
                                <g:textField id="txtLastName" title="Click to enter Last Name" placeholder="Last Name"
                                             name="lastName" errorMessage="Please enter Last Name"
                                             class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblEmail" for="txtEmail">Email ID</label>
                            </span>
                            <span class="col-md-7">
                                <g:textField id="txtEmail" title="Click to enter Email ID" placeholder="Email ID"
                                             name="email" errorMessage="Please enter Email ID"
                                             class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblUserName" for="txtUserName">Username</label>
                            </span>
                            <span class="col-md-7">
                                <g:textField id="txtUserName" title="Click to enter User Name" placeholder="User Name"
                                             name="username" errorMessage="Please enter Username"
                                             class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblPassword" for="txtPassword">Password</label>
                            </span>
                            <span class="col-md-7">
                                <g:passwordField type="password" id="txtPassword" title="Click to enter Password"
                                                 placeholder="Password" name="password" errorMessage="Please enter Password"
                                                 class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblConfirmPass" for="txtConfirmPass">Confirm Password</label>
                            </span>
                            <span class="col-md-7">
                                <input type="password" id="txtConfirmPass" title="Click to Confirm Password"
                                       placeholder="Confirm Password" errorMessage="Please enter Confirm Password"
                                       class="form-control" mandatory="1"/>
                            </span>

                            <div class="clearfix"></div>
                            <span class="col-md-5" style="margin-top: 5px">
                                <label id="lblPhoto" for="txtPhoto">Photo</label>
                            </span>
                            <span class="col-md-7">
                                <input type="file" id="txtPhoto" name="file"
                                       style="width: 215px;text-overflow: ellipsis;"/>
                            </span>

                            <div class="clearfix"></div>
                        </div>

                        <div style="margin-top: 10px">
                            <input id="btnRegister" value="Register" type="button"
                                   style="margin-right: 17px; width: 100px" class="btn btn-primary pull-right"/>
                        </div>
                    </div>
                </div>

            </form>

        </div>

        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="float: left; margin-top: 12px">
            <div class="recentShares col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0">
                <div class="divTitle">
                    Recent Shares
                </div>

                <div class="divbody">
                    <div class="nodata text-center">No data available to display</div>
                    <g:each in="${recent}" var="p">
                        <li>${p.name}</li>
                    </g:each>
                </div>
            </div>

            <div class="topPosts col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0">
                <div class="divTitle">
                    Top Posts
                </div>

                <div class="divbody">
                    <g:if test="${top.size() > 0}">
                        <g:each in="${top}" var='q'>
                            
                        </g:each>
                    </g:if>
                    <g:else>
                        <div class="nodata text-center">No data available to display</div>
                    </g:else>


                </div>
            </div>

        </div>
    </div>
</div>

<g:render template="/dashboard/footer"/>


</body>
</html>