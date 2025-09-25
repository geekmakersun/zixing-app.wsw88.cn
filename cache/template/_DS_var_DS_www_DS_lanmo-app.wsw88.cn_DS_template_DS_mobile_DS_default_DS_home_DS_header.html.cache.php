<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="zh-cn">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title><?php echo $meta_title; ?></title>
    <meta content="<?php echo $meta_keywords; ?>" name="keywords" />
    <meta content="<?php echo $meta_description; ?>" name="description" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <!-- 主要css开始 -->
    <link href="<?php echo THEME_PATH; ?>assets/icon/css/icon.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>assets/global/css/admin.min.css" rel="stylesheet" type="text/css" />
    <!-- 主要css结束 -->
    <!-- 风格css开始 -->
    <link href="<?php echo HOME_THEME_PATH; ?>web/css/style.css" rel="stylesheet" type="text/css" />
    <!-- 风格css结束 -->
    <link rel="stylesheet" type="text/css" href="<?php echo MOBILE_THEME_PATH; ?>css/mobile.css" />
    <!-- 系统懒人版js(所有自建模板引用) -->
    <script type="text/javascript">var is_mobile_cms = '1';var web_dir = '<?php echo WEB_DIR; ?>';</script>
    <script src="<?php echo LANG_PATH; ?>lang.js" type="text/javascript"></script>
    <script src="<?php echo ROOT_THEME_PATH; ?>assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<?php echo ROOT_THEME_PATH; ?>assets/js/cms.js" type="text/javascript"></script>
    <!-- 系统懒人版js结束 -->
    <script src="<?php echo ROOT_THEME_PATH; ?>assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo HOME_THEME_PATH; ?>web/scripts/app.min.js" type="text/javascript"></script>
    <script src="<?php echo MOBILE_THEME_PATH; ?>js/mobile.js" type="text/javascript"></script>

</head>
<body class="page-container-bg-solid">
<div class="top-category-menu" style="display: none">
    <div class="top-category-back" onclick="dr_m_top_category2()">
        <i class="fa fa-angle-left"></i> 返回
    </div>
    <div class="top-category-list">
        <div class="p1-nav">
            <h5><a href="<?php echo SITE_MURL; ?>">首页</a></h5>
        </div>
        <!--调用共享栏目-->
        <!--第一层：调用pid=0表示顶级-->
        <?php $list_return = $this->list_tag("action=category module=share pid=0"); if ($list_return && is_array($list_return)) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return) && $return) { $key=-1; foreach ($return as $t) { $key++; $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
        <div class="p1-nav">
            <h5><a href="<?php echo $t['url']; ?>" class="<?php if (IS_SHARE && dr_in_array($catid, $t['catids'])) { ?> active<?php } ?>" title="<?php echo $t['name']; ?>"><?php echo $t['name']; ?></a></h5>
            <?php if ($t['child']) { ?>
            <div class="p2-nav">
                <!--第二层-->
                <?php $list_return_t2 = $this->list_tag("action=category module=share pid=$t[id]  return=t2"); if ($list_return_t2 && is_array($list_return_t2)) extract($list_return_t2, EXTR_OVERWRITE); $count_t2=dr_count($return_t2); if (is_array($return_t2) && $return_t2) { $key_t2=-1;  foreach ($return_t2 as $t2) { $key_t2++; $is_first=$key_t2==0 ? 1 : 0;$is_last=$count_t2==$key_t2+1 ? 1 : 0; ?>
                <a href="<?php echo $t2['url']; ?>"  class="<?php if (IS_SHARE && $catid && dr_in_array($catid, $t2['catids'])) { ?> active<?php } ?>" title="<?php echo $t2['name']; ?>"><?php echo $t2['name']; ?></a>
                <?php } } ?>
            </div>
            <div class="clearfix"></div>
            <?php } ?>
        </div>
        <?php } } ?>

        <!--调用全部独立模块-->
        <?php $list_return_m = $this->list_tag("action=cache name=module-content  return=m"); if ($list_return_m && is_array($list_return_m)) extract($list_return_m, EXTR_OVERWRITE); $count_m=dr_count($return_m); if (is_array($return_m) && $return_m) { $key_m=-1;  foreach ($return_m as $m) { $key_m++; $is_first=$key_m==0 ? 1 : 0;$is_last=$count_m==$key_m+1 ? 1 : 0; ?>
        <?php if (!$m['share']) { ?>
        <div class="p1-nav">
            <h5><a href="<?php echo $m['url']; ?>" class="<?php if (MOD_DIR==$m['dirname']) { ?>active<?php } ?>" title="<?php echo $m['name']; ?>"><?php echo $m['name']; ?></a></h5>
            <?php if ($t['child']) { ?>
            <div class="p2-nav">
                <!--调用独立模块下的栏目-->
                <?php $list_return_t2 = $this->list_tag("action=category module=$m[dirname] pid=0  return=t2"); if ($list_return_t2 && is_array($list_return_t2)) extract($list_return_t2, EXTR_OVERWRITE); $count_t2=dr_count($return_t2); if (is_array($return_t2) && $return_t2) { $key_t2=-1;  foreach ($return_t2 as $t2) { $key_t2++; $is_first=$key_t2==0 ? 1 : 0;$is_last=$count_t2==$key_t2+1 ? 1 : 0; ?>
                <a href="<?php echo $t2['url']; ?>"  class="<?php if (MOD_DIR==$m['dirname'] && $catid && dr_in_array($catid, $t2['catids'])) { ?> active<?php } ?>" title="<?php echo $t2['name']; ?>"><?php echo $t2['name']; ?></a>
                <?php } } ?>
            </div>
            <div class="clearfix"></div>
            <?php } ?>
        </div>


        <?php } ?>
        <?php } } ?>
    </div>
</div>

<div class="top-search-menu" style="display: none">
    <div class="top-search-back" onclick="dr_m_top_search2()">
        <i class="fa fa-angle-left"></i> 返回
    </div>
    <div class="top-search-list">

        <form class="search-form" action="<?php echo SITE_MURL; ?>index.php" method="get">
            <input type="hidden" name="s" value="api">
            <input type="hidden" name="c" value="api">
            <input type="hidden" name="m" value="search">
            <input type="hidden" name="dir" id="dr_search_module_dir" >
            <div class="input-group">
                <div class="input-group-btn btn-group">
                    <button id="dr_search_module_name" type="button" class="btn default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-angle-down"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <!--这是来列出全部可以搜索的内容模块-->
                        <?php $top_search=[]; ?>
                        <?php $list_return = $this->list_tag("action=cache name=module-content"); if ($list_return && is_array($list_return)) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return) && $return) { $key=-1; foreach ($return as $t) { $key++; $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
                        <?php if ($t['search']) {  !$top_search && $top_search=$t; ?>
                        <li><a href="javascript:dr_search_module_select('<?php echo $t['dirname']; ?>', '<?php echo $t['name']; ?>');"> <?php echo $t['name']; ?> </a></li>
                        <?php } ?>
                        <?php } } ?>
                    </ul>
                </div>
                <input type="text" placeholder="搜索内容..." name="keyword" class="fc-search-keyword form-control">
                <div class="input-group-btn">
                    <button class="btn default" type="submit"> 搜索 </button>
                </div>
            </div>
            <script>
                // 这段js是用来执行搜索的
                function dr_search_module_select(dir, name) {
                    $("#dr_search_module_dir").val(dir);
                    $("#dr_search_module_name").html(name+' <i class="fa fa-angle-down"></i>');
                }
                dr_search_module_select('<?php echo MOD_DIR ? MOD_DIR : $top_search['dirname'] ?>', '<?php echo MOD_DIR ? MODULE_NAME : $top_search['name'] ?>');
            </script>
        </form>

    </div>
</div>