<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src=${admin.headUrl} class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${admin.userName}</p>
                <a href="#"><i class="fa fa-circle text-success"></i>在线</a>
            </div>
        </div>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header"><h4>功能菜单</h4></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i> <span>用户管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/user/show"><i class="fa fa-circle-o"></i>用户列表</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i>用户回收站</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>内容管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/content/category/show"><i class="fa fa-circle-o"></i>
                        标题列表</a></li>
                    <li><a href="/content/top/show"><i class="fa fa-circle-o"></i>
                        头部内容列表</a></li>
                    <li><a href="/content/show"><i class="fa fa-circle-o"></i>
                        尾部内容列表</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i>
                        内容回收站</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i> <span>爬虫管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/crawler/conditions"><i class="fa fa-circle-o"></i>爬虫</a></li>
                </ul>
            </li>
        </ul>
    </section>
</aside>
