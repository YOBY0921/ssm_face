<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="main-header" style="width:100%;position:fixed">
    <!-- Logo -->
    <a class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <%--<span class="logo-mini"><b>北博</b>智能AI-Fence</span>--%>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b></b>人脸识别考勤系统</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <!--<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">-->
        <!--<span class="sr-only">切换导航</span>-->
        <!--</a>-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav" style="width: auto">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${ctx}/static/img/avatar.png" class="user-image" alt="User Image">
                        <span class="hidden-xs" id="nickname1"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="${ctx}/static/img/avatar.png" class="img-circle" alt="User Image">
                            <p>
                                <input type="text" id="role2" readonly="readonly"
                                       style="border: 0px; text-align: center; width: auto;  background-color: transparent"
                                       name="admin_role">
                                <small>
                                    <input type="text" id="nickname2"
                                           style="border: 0px; text-align:center; width: auto; background-color: transparent"
                                           name="admin_nickname" readonly="readonly">
                                </small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#"></a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#"></a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#"></a>
                                </div>
                            </div>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="{:url('index/admin/profile')}" class="btn btn-default btn-flat">个人资料</a>
                            </div>
                            <div class="pull-right">
                                <a class="btn btn-default btn-flat login_out">退出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

<aside class="main-sidebar" id="sidebar" style="position:fixed">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/static/img/avatar.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p></p>
                <a><i class="fa fa-circle " id="circle"></i>
                    <p id="status" class="pull-right" style="margin-top: 1px;"></p>
                </a>
            </div>
        </div>

        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="treeview" id="monitor">
                <a href="javascript:void(0)">
                    <i class="fa fa-bar-chart"></i>
                    <span>监控中心</span>
                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                </a>
                <ul class="treeview-menu">
                    <li id="monitor_index">
                        <a href="/index/monitor/index">
                            <i class="fa fa-bell"></i>
                            <span>实时告警信息</span>
                        </a>
                    </li>
                    <li id="count">
                        <a href="/index/monitor/count">
                            <i class="fa fa-bar-chart"></i>
                            <span>告警统计管理</span>
                        </a>
                    </li>
                    <li id="location">
                        <a href="/index/monitor/location">
                            <i class="fa fa-map"></i>
                            <span>电子地图</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview" id="warn">
                <a href="javascript:void(0);">
                    <i class="fa fa-bell"></i>
                    <span>告警中心</span>
                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                </a>
                <ul class="treeview-menu">
                    <li id="warn_index">
                        <a href="/index/warn/index">
                            <i class="fa fa-bell"></i>
                            <span>告警信息管理</span>
                        </a>
                    </li>
                    <li id="realtime">
                        <a href="/index/warn/realtime">
                            <i class="fa fa-exclamation-triangle"></i>
                            <span>未确认告警信息</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview" id="device">
                <a href="javascript:void(0);">
                    <i class="fa fa-cubes"></i>
                    <span>设备中心</span>
                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                </a>
                <ul class="treeview-menu">
                    <li id="device_index">
                        <a href="/index/device/index">
                            <i class="fa fa-cubes"></i>
                            <span>设备管理</span>
                        </a>
                    </li>
                    <li id="supplier_index">
                        <a href="/index/supplier/index">
                            <i class="fa fa-address-card-o"></i>
                            <span>供应商管理</span>
                        </a>
                    </li>
                    <li id="channels_index">
                        <a href="/index/channels/index">
                            <i class="fa fa-balance-scale"></i>
                            <span>检测中心</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="active treeview menu-open" id="admin">
                <a href="javascript:void(0);">
                    <i class="fa fa-user-circle-o"></i>
                    <span>用户中心</span>
                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                </a>
                <ul class="treeview-menu">
                    <li id="admin_index" class="active">
                        <a href="/index/user/index">
                            <i class="fa fa-user-circle-o"></i>
                            <span>用户管理</span>
                        </a>
                    </li>
                    <li id="pro">
                        <a href="/index/user/profile">
                            <i class="fa fa-edit"></i>
                            <span>个人资料</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </section>
</aside>
