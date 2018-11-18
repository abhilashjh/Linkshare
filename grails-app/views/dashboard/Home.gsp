
<%@ page import="com.Visibility" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="master"/>
    <title>Dashboard</title>
    <style type="text/css"  >

        .divTitle{
            background-color: #f7f7f7;
            height: 30px;
            padding:5px;
            border-bottom: 1px solid #CCCCCC;
        }

        .divbody>.nodata{
            padding-top: 100px;
            color: maroon;
        }

        .search{
            width: 33% !important;
            float: right !important;
        }
        .userOptions{
            margin-top: 13px;
            margin-left: 7px;
            float: right;
        }

        .userOptions>span{
            padding: 3px;

        }

        .userOptions>.fa{
            color:#2b669a;

        }

        .userOptions>.fa:hover{
            color:#FFFFFF;
            background-color: #2b669a;
            cursor: pointer;
        }

        .dropdown-menu{
            left: auto !important;
        }


        .dropdown-menu>li{
            border-bottom: solid 1px #cccccc;
        }

        .dropdown-menu>li .fa{
            margin-right: 5px;
        }

        .dropdown-menu>li:last-child{
            border-bottom: none;
        }

        .userActions>#dLabel{
            max-width: 160px;
            min-width: 160px;
        }

        .divbody{
            min-height: 250px;
            max-height: 250px;
        }

        .modal-body label{
            line-height: 3em;
        }

    </style>
    <g:javascript src="home.js"/>
</head>

<body>

<g:render template="/dashboard/userHeader" />
<div class="col-lg-12 col-md-12" style="background-color:#cccccc;position: absolute; top:62px; bottom: 20px;overflow-y: auto">
<div class="container" style="margin-top: 5px; background-color: #FFFFFF; border-radius: 10px; min-height: 550px">
    <div class="row" style="margin-right: -5px!important;">

        <div class="col-lg-12 col-md-12">

        <div class="row">
            <div id="divUserInfo" style="border-radius: 5px; border: 1px solid #CCCCCC; margin-top: 10px; margin-left: 10px;height: 100px; padding-top: 5px">
                <div class="col-lg-1 col-md-1">
                    <img class="media-object pull-left" style="border: 1px solid #cccccc;" src="${createLinkTo(dir: 'images', file: 'User.jpg')}" height="90px" width="90px">
                </div>
                <div class="col-lg-11 col-md-11">
                    <span style="font-size: x-large">Welcome, ${session["FullName"]}</span> <span style="font-size: small">@${session["Username"]}</span>
                    <br />
                    <div class="col-lg-1 col-md-1" style="text-align: center">
                        <span style="font-size: small">Subscription</span>
                    </div>
                    <div  class="col-lg-1 col-md-1" style="text-align: center">
                        <span style="font-size: small">Topics</span>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-lg-1 col-md-1" style="text-align: center">
                        <span style="font-size: small" class="text-center">0</span>
                    </div>
                    <div  class="col-lg-1 col-md-1" style="text-align: center">
                        <span style="font-size: small">0</span>
                    </div>
                </div>
            </div>
        </div>

            </div>

        <div class="col-lg-6 col-md-6">


            <div class="row">
                <div id="divSubscriptions" style="border-radius: 5px; border: 1px solid #CCCCCC; margin-top: 10px; margin-left: 10px;">
                    <div class="divTitle">
                        Subscriptions
                    </div>

                    <div class="divbody">
                        <div class="nodata text-center">No data available to display</div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div id="divTrends" style="border-radius: 5px; border: 1px solid #CCCCCC; margin-top: 10px; margin-left: 10px;">
                    <div class="divTitle">
                        Tending Topics
                    </div>

                    <div class="divbody">
                        <div class="nodata text-center">No data available to display</div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-6 col-md-6">
            <div class="row">
                <div id="divInbox" style="border-radius: 5px; border: 1px solid #CCCCCC; margin-top: 10px; margin-left: 10px;">
                    <div class="divTitle">
                        Inbox
                    </div>

                    <div class="divbody">
                        <div class="nodata text-center">No data available to display</div>
                    </div>
                </div>
            </div>
         </div>
    </div>
</div>
</div>


<div class="modal fade" id="modalInvite" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Send Invitation</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtEmail" id="lblEmail">Email</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:textField name="email" id="txtEmail" mandatory="1" placeholder="Email ID" maxlength="100"
                                     title="Click here to enter Email ID" class="form-control"
                                     errorMessage="Please enter a valid Email ID"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="ddlTopic" id="lblTopic">Topic</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:select id="ddlTopic" name="com.Topic" from="${1..5}" noSelection="['': 'Select Topic']"
                                  mandatory="1" class="form-control" errorMessage="Please select a Topic"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary pull-right">Invite</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="modalShareLink" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Share Link</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtLink" id="lblLink">Link</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:textField name="link" id="txtLink" mandatory="1" placeholder="Link" maxlength="100"
                                     title="Click here to enter Link of Resource" class="form-control"
                                     errorMessage="Please enter a Link." />
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtLinkDesc" id="lblLinkDesc">Description</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:textField name="description" id="txtLinkDesc" mandatory="0" placeholder="Description" maxlength="100"
                                     title="Click here to enter Description" class="form-control"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="ddlTopicLink" id="lblTopicLink">Topic</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:select id="ddlTopicLink" name="com.Topic" from="${1..5}" noSelection="['': 'Select Topic']"
                                  mandatory="1" class="form-control" errorMessage="Please select a Topic."/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Share</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="modalShareDoc" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Share Document</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtLink" id="lblDoc">Document</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <input type="file" name="link" id="txtDoc" mandatory="1" placeholder="Link"
                                     title="Upload files" class="form-control" errorMessage="No document attached"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtDocDesc" id="lblDocDesc">Description</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:textField name="description" id="txtDocDesc" mandatory="1" placeholder="Description" maxlength="100"
                                     title="Click here to enter Description" class="form-control" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="ddlTopicDoc" id="lblTopicDoc">Topic</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:select id="ddlTopicDoc" name="com.Topic" from="${1..5}" noSelection="['': 'Select Topic']"
                                  mandatory="1" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Share</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="modalTopicCreate" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Create Topic</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="txtTopicName" id="lblTopicName">Name</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:textField name="Name" id="txtTopicName" mandatory="1" placeholder="Name" maxlength="100"
                                     title="Click here to enter Topic Name" class="form-control"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label for="ddlVisibility" id="lblVisibility">Visibility</label>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <g:select id="ddlVisibility" name="Visibility" from="${com.Visibility.list()}"
                                  noSelection="['': '--Select Visibility--']" mandatory="1" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnCreteTopic" >Save</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<g:render template="/dashboard/footer" />

</body>
</html>