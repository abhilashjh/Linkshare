<header class="pageHeader">
    <div class="container-fluid">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <img id="imgLogo" src="${createLinkTo(dir: 'images', file: 'logo.png')}" alt="cannot load logo"/>
        </div>

        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <h2 id="title" style="color: #2b669a; float: right">Link Sharing</h2>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

            <div class="userActions">
                <button id="dLabel" type="button" class="btn btn-default" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${session["FullName"]}
                    <span class="caret"></span>

                </button>
                <ul class="dropdown-menu" aria-labelledby="dLabel">
                    <li><a href="#"><span class="fa fa-user-circle-o"></span>Profile</a></li>
                    <li><a href="#"><span class="fa fa-user-circle-o"></span>Users</a></li>
                    <li><a href="#"><span class="fa fa-edit"></span>Posts</a></li>
                    <li><a href="#"><span class="fa fa-file"></span>Topic</a></li>
                    <li><a href="${createLink(uri: '/logout')}"><span class="fa fa-sign-out"></span>Logout</a></li>
                </ul>
            </div>
            <div class="userOptions">
                <span class="fa fa-comment fa-2x" data-toggle="modal" data-target="#modalTopicCreate"></span>
                <span class="fa fa-envelope fa-2x" data-toggle="modal" data-target="#modalInvite"></span>
                <span class="fa fa-link fa-rotate-90 fa-2x" data-toggle="modal" data-target="#modalShareLink"></span>
                <span class="fa fa-file fa-2x" data-toggle="modal" data-target="#modalShareDoc"></span>

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