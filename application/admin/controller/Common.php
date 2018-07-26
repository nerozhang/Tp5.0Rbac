<?php

namespace app\admin\controller;

use think\Db;
use think\Controller;

class Common extends Controller {

    protected $mod, $role, $system, $nav, $menudata, $cache_model, $categorys, $module, $moduleid, $adminRules, $HrefId;

    public function initialize() {
        //判断管理员是否登录
        if (!session('sub')) {
            $this->redirect('admin/login/index');
        }
    }

    //空操作
    public function _empty() {
        return $this->error('空操作，返回上次访问页面中...');
    }

}
