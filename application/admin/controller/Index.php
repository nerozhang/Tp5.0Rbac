<?php

namespace app\admin\controller;

use app\admin\model\Role;
use think\Session;
use think\Db;

class Index extends Base {

    /**
     * 首页html展示
     * @return mixed
     */
    public function index() {
        $sub = Session::get("sub");
        $temp = Session::get("temp");
        return $this->fetch("index", ["sub" => $sub, "temp" => $temp]);
    }

//控制面板Html展示
    public function main() {
        $version = Db::query('SELECT VERSION() AS ver');
        $config = [
            'url' => $_SERVER['HTTP_HOST'],
            'document_root' => $_SERVER['DOCUMENT_ROOT'],
            'server_os' => PHP_OS,
            'server_port' => $_SERVER['SERVER_PORT'],
            'server_ip' => $_SERVER['SERVER_ADDR'],
            'server_soft' => $_SERVER['SERVER_SOFTWARE'],
            'php_version' => PHP_VERSION,
            'mysql_version' => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize'),
            'agent' => $_SERVER['HTTP_USER_AGENT']
        ];
        $this->assign('config', $config);
        return $this->fetch();
    }

    //退出登陆
    public function logout() {
        session(null);
        $this->redirect('login/index');
    }

}
