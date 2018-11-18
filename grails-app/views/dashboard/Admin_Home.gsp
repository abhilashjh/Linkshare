
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="master"/>
    <title>Dashboard</title>
    <style type="text/css">
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

    .fa:hover{
        color:#FFFFFF;
        background-color: #2b669a;
        cursor: pointer;
    }

    .dropdown-menu{
        left: auto !important;
    }

    .userActions>#dLabel{
        max-width: 160px;
        min-width: 160px;
    }


    </style>
</head>

<body>
<g:render template="/dashboard/userHeader" />

<g:render template="/dashboard/footer" />
</body>
</html>