<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8" />
    <title><?php echo dr_lang('%s - 后台管理平台', SITE_NAME); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="<?php echo $THEME_PATH; ?>assets/global/css/plugins.bundle<?php if (!IS_XRDEV) { ?>.min<?php } ?>.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $THEME_PATH; ?>assets/icon/css/icon.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
    <script type="text/javascript">var admin_file = '<?php echo SELF; ?>';var is_min = '<?php echo $is_min; ?>'; var is_oemcms = '<?php echo IS_OEM_CMS; ?>'; var is_mobile_cms = '<?php echo $is_mobile; ?>'; var is_admin = '<?php if (dr_in_array(1, $admin['roleid'])) { ?>1<?php } else { ?>2<?php } ?>';</script>
    <script src="<?php echo $LANG_PATH; ?>lang.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo $THEME_PATH; ?>assets/global/scripts/plugins.bundle.js"></script>
    <script src="<?php echo $THEME_PATH; ?>assets/js/cms.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo $THEME_PATH; ?>assets/global/plugins/jquery.md5.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script>
        function wSize(){
            var str=getWindowSize();
            var strs= new Array(); //定义一数组
            strs=str.toString().split(","); //字符分割
            var heights = strs[0]-70,Body = $('body');
            $('#right_page').height(heights);
        }
        if(!Array.prototype.map)
            Array.prototype.map = function(fn,scope) {
                var result = [],ri = 0;
                for (var i = 0,n = this.length; i < n; i++){
                    if(i in this){
                        result[ri++]  = fn.call(scope ,this[i],i,this);
                    }
                }
                return result;
            };
        var getWindowSize = function(){
            return ["Height","Width"].map(function(name){
                return window["inner"+name] ||
                    document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
            });
        }

        $(function(){
            window.onresize=wSize;
            wSize();
            $('#kt_header_user_menu_toggle').mousemove(function(){
                if ($('#kt_header_user_menu_toggle .cursor-pointer').hasClass('show')) {

                } else {
                    $('#kt_header_user_menu_toggle .cursor-pointer').click();
                }
            });
            $('#kt_header_user_menu_toggle .menu-sub-dropdown').mouseleave(function(){
                if ($('#kt_header_user_menu_toggle .cursor-pointer').hasClass('show')) {
                    $('#kt_header_user_menu_toggle .cursor-pointer').click();
                } else {

                }
            });
            <?php if (!isset($_GET['go'])) { ?>
            dr_go_top();
            <?php } ?>
            var offset = 100;
            var duration = 500;
            if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) {  // ios supported
                $('#kt_aside_menu_wrapper').bind("touchend touchcancel touchleave", function(e){
                    if ($(this).scrollTop() > offset) {
                        $('.scroll-to-top').fadeIn(duration);
                    } else {
                        $('.scroll-to-top').fadeOut(duration);
                    }
                });
            } else {  // general
                $('#kt_aside_menu_wrapper').scroll(function() {
                    if ($(this).scrollTop() > offset) {
                        $('.scroll-to-top').fadeIn(duration);
                    } else {
                        $('.scroll-to-top').fadeOut(duration);
                    }
                });
            }
        });

        function dr_go_top(){
            $('#kt_aside_menu_wrapper').animate({
                scrollTop: -15 // 初始化菜单位置
            })
        }
        function Mlink(top, left, link, url) {
            if (url) {
                $('.dr_menu_left').removeClass('here show');
                $('#dr_menu_left_'+left).addClass('here show');
                $('#dr_menu_link_'+link).addClass('here show');
                $('.menu-item .menu-link').removeClass('active');
                $('#dr_menu_link_a_'+link).addClass('active');
                dr_go_url(url, $('#dr_menu_link_'+link).html());
            }
        }
        // 退出
        function dr_logout(url) {
            var r=confirm(lang['logout']);
            if (r==true) {
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    url: url,
                    success: function(json) {
                        if (json.code == 1) {
                            setTimeout("window.location.href='<?php echo dr_url("login/index"); ?>'", 1000);
                        }
                        dr_tips(json.code, json.msg);
                    },
                    error: function(HttpRequest, ajaxOptions, thrownError) {
                        dr_ajax_alert_error(HttpRequest, this, thrownError);
                    }
                });
            }
        }
        function dr_select_site(id) {
            var r=confirm('<?php echo dr_lang("你确定要切换到选中站点吗？"); ?>')
            if (r==true) {
                window.location.href='<?php echo dr_url("sites/api/login_select"); ?>&id='+id
            }
        }
        function dr_tab_close() {
            $('#dr_go_url .menu-item').remove();
        }
        function dr_go_url(url, name, nocache) {
                $('#kt_aside').removeClass('drawer-on');
                $('#kt_aside_mobile_toggle').removeClass('active');
                $('.dr_active_menu_icon').removeClass('show');
                $('.dr_active_menu_sub').removeClass('show');
                $('.dr_active_menu_sub').hide();
                $('#kt_body').removeAttr('data-kt-drawer-aside');
                $('#kt_body').removeAttr('data-kt-drawer');
                $('.drawer-overlay').remove();
                <?php if (SYS_NOT_ADMIN_CACHE || $is_mobile) { ?>
                $("#right_page").attr('src', url);
                $("#right_page").attr("url", url);
                $('#dr_tab_close').remove();
                <?php } else { ?>
                var cmd = $.md5(url);
                $('#myiframe iframe').hide();
                $('#myiframe').attr("cid", 'right_page_'+cmd);
                $('#dr_go_url .menu-item').removeClass('here show');

                if ($('#right_page_'+cmd).length > 0) {
                    // 存在
                    $('#right_page_'+cmd).show();
                    $('#dr_go_url_'+cmd).addClass('here show');
                    var iurl = document.getElementById("right_page_"+cmd).contentWindow.location.href;
                    if (iurl.indexOf(url) == -1 && nocache != 'true') {
                        // 地址不符合，重置
                        $('#right_page_'+cmd).attr('src', url);
                    }
                } else {
                    $('#dr_tab_close').remove();
                    var html = '<iframe class="myiframe" name="right" id="right_page_'+cmd+'" src="'+url+'" url="'+url+'" style="border:none; margin-bottom:0px;height:'+$('#right_page').height()+'px" width="100%" height="auto" allowtransparency="true"></iframe>';
                    $("#myiframe").append(html);
                }

                if (name && $('#dr_go_url_'+cmd).length == 0) {

                    $('#dr_tab_close').remove();
                    $('#dr_go_url').prepend('<div id="dr_go_url_'+cmd+'" class="menu-item here show menu-lg-down-accordion me-lg-1"><span class="menu-link py-3"><a class="menu-title" href="javascript:;" onclick="dr_go_url(\''+url+'\', \'\', \'true\')">'+name+'</a><i onclick="$(\'#dr_go_url_'+cmd+'\').remove();" class="close-tab fa fa-remove"></i></span></div>');
                    if ($('#dr_tab_close').length == 0) {
                        $('#dr_go_url').prepend('<div id="dr_tab_close" class="menu-item menu-lg-down-accordion me-lg-1"><span class="menu-link py-3"><i style="margin-right:0;" title="<?php echo dr_lang('全部移除'); ?>" onclick="dr_tab_close()" class="fa fa-trash"></i></span></div>');
                    }
                }
                <?php } ?>
                }

            function dr_update_cache_all() {

                    var index = layer.load(2, {
                        shade: [0.3,'#fff'], //0.1透明度的白色背景
                        time: 10000
                    });
                    $.ajax({type: "GET",dataType:"json", url: admin_file+"?c=api&m=cache_update",
                        success: function(json) {
                            layer.close(index);
                            dr_tips(1, "<?php echo dr_lang('全站缓存更新完成'); ?>");
                        },
                        error: function(HttpRequest, ajaxOptions, thrownError) {
                            layer.closeAll('loading');
                            dr_tips(0, "<?php echo dr_lang('更新失败，请检查错误日志'); ?>");
                        }
                    });
                }
                function dr_update_cache_data() {

                        var index = layer.load(2, {
                            shade: [0.3,'#fff'], //0.1透明度的白色背景
                            time: 10000
                        });
                        $.ajax({type: "GET",dataType:"json", url: admin_file+"?c=api&m=cache_clear",
                            success: function(json) {
                                layer.close(index);
                                dr_tips(1, "<?php echo dr_lang('前端数据缓存更新完成'); ?>");
                            },
                            error: function(HttpRequest, ajaxOptions, thrownError) {
                                layer.closeAll('loading');
                                dr_tips(0, "<?php echo dr_lang('更新失败，请检查错误日志'); ?>");
                            }
                        });
                    }
                function dr_search_menu(kw) {
                    $('#dr_search_loading').show();
                    $('#dr_search_menu').html('');
                    $.ajax({type: "GET",dataType:"json", url: admin_file+"?c=api&m=search_menu&kw="+kw,
                        success: function(json) {
                            $('#dr_search_loading').hide();
                            $('#dr_search_menu').html(json.msg);
                        },
                        error: function(HttpRequest, ajaxOptions, thrownError) {
                            $('#dr_search_loading').hide();
                            dr_tips(0, "<?php echo dr_lang('请求失败，请检查错误日志'); ?>");
                        }
                    });
                }
    </script>
</head>


<body scroll="no" id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed aside-enabled aside-fixed" style="overflow: hidden;--kt-toolbar-height:0px;--kt-toolbar-height-tablet-and-mobile:0px">

<div class="d-flex flex-column flex-root">

    <div class="page d-flex flex-row flex-column-fluid">

        <div id="kt_aside" class="aside aside-dark aside-hoverable" data-kt-drawer="true" data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_mobile_toggle">

            <div class="aside-logo flex-column-auto" id="kt_aside_logo">

                <a href="/" target="_blank">
                    <img alt="<?php echo SITE_NAME; ?>" src="<?php echo $THEME_PATH; ?>assets/logo-admin.png" class="h-35px logo" />
                </a>

                <div id="kt_aside_toggle" class="btn btn-icon w-auto px-0 btn-active-color-primary aside-toggle" data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body" data-kt-toggle-name="aside-minimize">
                    <span class="svg-icon svg-icon-1 rotate-180">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path opacity="0.5" d="M14.2657 11.4343L18.45 7.25C18.8642 6.83579 18.8642 6.16421 18.45 5.75C18.0358 5.33579 17.3642 5.33579 16.95 5.75L11.4071 11.2929C11.0166 11.6834 11.0166 12.3166 11.4071 12.7071L16.95 18.25C17.3642 18.6642 18.0358 18.6642 18.45 18.25C18.8642 17.8358 18.8642 17.1642 18.45 16.75L14.2657 12.5657C13.9533 12.2533 13.9533 11.7467 14.2657 11.4343Z" fill="currentColor" />
                            <path d="M8.2657 11.4343L12.45 7.25C12.8642 6.83579 12.8642 6.16421 12.45 5.75C12.0358 5.33579 11.3642 5.33579 10.95 5.75L5.40712 11.2929C5.01659 11.6834 5.01659 12.3166 5.40712 12.7071L10.95 18.25C11.3642 18.6642 12.0358 18.6642 12.45 18.25C12.8642 17.8358 12.8642 17.1642 12.45 16.75L8.2657 12.5657C7.95328 12.2533 7.95328 11.7467 8.2657 11.4343Z" fill="currentColor" />
                        </svg>
                    </span>
                </div>
            </div>


            <div class="aside-menu flex-column-fluid">
                <!--begin::Aside Menu-->
                <div class="hover-scroll-overlay-y" id="kt_aside_menu_wrapper" data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_aside_logo, #kt_aside_footer" data-kt-scroll-wrappers="#kt_aside_menu" data-kt-scroll-offset="0">
                    <!--begin::Menu-->
                    <div class="menu menu-column menu-title-gray-800 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500" id="#kt_aside_menu" data-kt-menu="true" data-kt-menu-expand="false">


                        <?php if (isset($my_menu) && is_array($my_menu) && $my_menu) { $key_top=-1;$count_top=dr_count($my_menu);foreach ($my_menu as $tid=>$top) { $key_top++; $is_first=$key_top==0 ? 1 : 0;$is_last=$count_top==$key_top+1 ? 1 : 0; ?>
                        <div class="menu-item menu-accordion" id="dr_menu_top_<?php echo $top['id']; ?>">
                            <div class="menu-content pt-4 pb-0">
                                <span class="menu-section text-muted text-uppercase fs-8 ls-1"><?php echo dr_lang($top['name']); ?></span>
                            </div>
                        </div>

                        <?php if (isset($top['left']) && is_array($top['left']) && $top['left']) { $key_left=-1;$count_left=dr_count($top['left']);foreach ($top['left'] as $left) { $key_left++; $is_first=$key_left==0 ? 1 : 0;$is_last=$count_left==$key_left+1 ? 1 : 0;?>
                        <div data-kt-menu-trigger="click" id="dr_menu_left_<?php echo $left['id']; ?>" class="<?php if ($main_menu['pid']==$left['id']) { ?>here show <?php } ?> menu-item menu-accordion dr_menu_left">
                            <span class="menu-link">
                                <span class="menu-icon">
                                        <i class="<?php echo $left['icon']; ?>"></i>
                                </span>
                                <span class="menu-title"><?php echo dr_lang($left['name']); ?></span>
                                <span class="menu-arrow"></span>
                            </span>
                            <div class="menu-sub menu-sub-accordion menu-active-bg">
                                <?php if (isset($left['link']) && is_array($left['link']) && $left['link']) { $key_link=-1;$count_link=dr_count($left['link']);foreach ($left['link'] as $link) { $key_link++; $is_first=$key_link==0 ? 1 : 0;$is_last=$count_link==$key_link+1 ? 1 : 0;?>
                                <div class="menu-item">
                                    <a class="menu-link <?php if ($main_menu['id']==$link['id']) { ?> active<?php } ?>" id="dr_menu_link_a_<?php echo $link['id']; ?>" href="javascript:Mlink(<?php echo $tid; ?>, <?php echo $left['id']; ?>, <?php echo $link['id']; ?>, '<?php echo $link['url']; ?>');">
                                        <span class="menu-bullet">
                                           <i class="<?php echo $link['icon']; ?>"></i>
                                        </span>
                                        <span class="menu-title" id="dr_menu_link_<?php echo $link['id']; ?>"><?php echo dr_lang($link['name']); ?></span>
                                    </a>
                                </div>
                                <?php } } ?>

                            </div>
                        </div>
                        <?php } }  } } ?>


                    </div>
                    <!--end::Menu-->
                </div>
                <!--end::Aside Menu-->
            </div>

            <div class="aside-footer flex-column-auto pt-5 pb-7 px-5" id="kt_aside_footer">
                <div  class="btn btn-custom btn-primary w-100">
                    <a class="btn-label xr-version" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss-="click" title="<?php echo CMF_NAME; ?> V<?php echo CMF_VERSION; ?>" href="javascript:<?php if ($admin['adminid']==1) { ?>dr_go_url('<?php echo dr_url('cloud/update'); ?>')<?php } ?>;">V<?php echo CMF_VERSION; ?></a>
                    <a class="scroll-to-top" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss-="click" title="<?php echo dr_lang('回到顶端'); ?>" href="javascript:dr_go_top();"><i class="bi bi-arrow-up-circle-fill"></i></a>
                </div>
            </div>

        </div>


        <!--begin::Wrapper-->
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <!--begin::Header-->
            <div id="kt_header" style="" class="header align-items-stretch">
                <!--begin::Container-->
                <div class="container-fluid d-flex align-items-stretch justify-content-between">
                    <!--begin::Aside mobile toggle-->
                    <div class="d-flex align-items-center d-lg-none ms-n2 me-2" title="Show aside menu">
                        <div class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px" id="kt_aside_mobile_toggle">
                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs015.svg-->
                            <span class="svg-icon svg-icon-1">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
											<path d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z" fill="currentColor" />
											<path opacity="0.3" d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z" fill="currentColor" />
										</svg>
									</span>
                            <!--end::Svg Icon-->
                        </div>
                    </div>
                    <!--end::Aside mobile toggle-->
                    <!--begin::Mobile logo-->
                    <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
                        <a href="<?php echo SITE_URL; ?>" class="d-lg-none">
                            <i class="fa fa-home" style="font-size: 20px;margin-left: 10px;"></i>
                        </a>
                    </div>
                    <!--end::Mobile logo-->
                    <!--begin::Wrapper-->
                    <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
                        <!--begin::Navbar-->
                        <div class="d-flex align-items-stretch" id="kt_header_nav">
                            <?php if (!SYS_NOT_ADMIN_CACHE && !$is_mobile) { ?>
                            <div class="fc-mb-left-menu menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch" id="dr_go_url" data-kt-menu="true">

                            </div>
                            <?php } ?>
                        </div>

                        <div class="d-flex align-items-stretch flex-shrink-0">

                            <div class="d-flex align-items-stretch ms-1 ms-lg-3">
                                <!--begin::Search-->
                                <div id="kt_header_search" class="header-search d-flex align-items-stretch" data-kt-search-keypress="true" data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu" data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true" data-kt-menu-placement="bottom-end">
                                    <!--begin::Search toggle-->
                                    <div class="d-flex align-items-center dr_active_menu_icon" data-kt-search-element="toggle" id="kt_header_search_toggle">
                                        <div class="btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px">
                                            <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                            <span class="svg-icon svg-icon-1">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
															<rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
															<path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor" />
														</svg>
													</span>
                                            <!--end::Svg Icon-->
                                        </div>
                                    </div>
                                    <!--end::Search toggle-->
                                    <!--begin::Menu-->
                                    <div data-kt-search-element="content" class="dr_active_menu_sub menu menu-sub menu-sub-dropdown p-7 w-325px w-md-375px">
                                        <!--begin::Wrapper-->
                                        <div data-kt-search-element="wrapper">
                                            <!--begin::Form-->
                                            <form data-kt-search-element="form" class="w-100 position-relative mb-3" autocomplete="off">
                                                <span class="svg-icon svg-icon-2 svg-icon-lg-1 svg-icon-gray-500 position-absolute top-50 translate-middle-y ms-0">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																<rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
																<path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor" />
															</svg>
														</span>
                                                <input type="text" oninput="dr_search_menu(this.value)" class="search-input form-control form-control-flush ps-10" placeholder="<?php echo dr_lang('菜单搜索'); ?>" data-kt-search-element="input" />

                                                <span id="dr_search_loading" class="position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-1" data-kt-search-element="spinner">
															<span class="spinner-border h-15px w-15px align-middle text-gray-400"></span>
														</span>
                                            </form>
                                            <div class="separator border-gray-200 mb-6"></div>
                                            <div class="mb-5" id="dr_search_menu" data-kt-search-element="main">

                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Menu-->
                                </div>
                                <!--end::Search-->
                            </div>

                            <!--begin::Quick links-->
                            <div class="d-flex align-items-center ms-1 ms-lg-3">
                                <!--begin::Menu wrapper-->
                                <div class=" dr_active_menu_icon btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">

                                    <span class="svg-icon svg-icon-1">
                                        <i class="fa fa-link"></i>
											</span>
                                </div>
                                <!--begin::Menu-->
                                <div class="dr_active_menu_sub menu menu-sub menu-sub-dropdown menu-column w-250px w-lg-325px" data-kt-menu="true">
                                    <div class="py-2 text-center border-bottom">
                                        <a href="javascript:dr_add_menu();" class="btn btn-color-gray-600 btn-active-color-primary">
                                            <?php echo dr_lang('加入快捷菜单'); ?>
                                        </a>
                                    </div>
                                    <div id="dr_link_menu"><?php if ($fn_include = $this->_include("api_link_menu.html")) include($fn_include); ?></div>
                                    <div class="py-2 text-center">
                                        <a href="javascript:dr_go_url('<?php echo dr_url('api/my'); ?>');" class="btn btn-color-gray-600 btn-active-color-primary">
                                            <?php echo dr_lang('管理快捷菜单'); ?>
                                        </a>
                                    </div>

                                </div>
                                <!--end::Menu-->
                                <!--end::Menu wrapper-->
                            </div>
                            <!--end::Quick links-->

                            <?php if (count($ci->site_info) > 1) { ?>
                            <div class="d-flex align-items-center ms-1 ms-lg-3">
                                <div  class="btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                    <span class="svg-icon svg-icon-1">
                                        <i class="fa fa-share-alt"></i>
                                    </span>
                                </div>
                                <div class="menu menu-sub menu-sub-dropdown menu-column w-300px" data-kt-menu="true">
                                    <div class="tab-pane fade show active" role="tabpanel">

                                        <div class="scroll-y  my-5 px-8">
                                            <?php if (isset($ci->site_info) && is_array($ci->site_info) && $ci->site_info) { $key_t=-1;$count_t=dr_count($ci->site_info);foreach ($ci->site_info as $i=>$t) { $key_t++; $is_first=$key_t==0 ? 1 : 0;$is_last=$count_t==$key_t+1 ? 1 : 0;  if (\Phpcmf\Service::M('auth')->_check_site($i)) { ?>
                                            <div class="d-flex flex-stack py-4">
                                                <div class="d-flex align-items-center">
                                                    <div class="mb-0 me-2">
                                                        <a href="javascript:;" onclick="dr_select_site('<?php echo $i; ?>')" class="fs-6 text-gray-800 text-hover-primary fw-bolder"><?php echo dr_strcut($t['SITE_NAME'], 30); ?></a>
                                                        <div class="text-gray-400 fs-7"><?php echo trim(str_replace(['http://', 'https://'], '', $t['SITE_URL']), '/'); ?></div>
                                                    </div>
                                                </div>
                                                <?php if (SITE_ID == $i) { ?><span class="badge badge-light fs-8"><?php echo dr_lang('当前'); ?></span><?php } ?>
                                            </div>
                                            <?php }  } } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php }  if ($ci->_is_admin_auth('notice/index')) { ?>
                            <div class="d-flex align-items-center ms-1 ms-lg-3">
                                <div class="dr_active_menu_icon btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                    <span class="svg-icon svg-icon-1">
                                        <i class="fa fa-bell-o"></i>
                                    </span>
                                </div>
                                <div class="dr_active_menu_sub menu menu-sub menu-sub-dropdown menu-column w-250px w-lg-400px" data-kt-menu="true">
                                    <?php $notice = \Phpcmf\Service::M('auth')->admin_notice(10, true);?>
                                    <div class="scroll-y  my-5 px-8">

                                        <?php if (isset($notice) && is_array($notice) && $notice) { $key_t=-1;$count_t=dr_count($notice);foreach ($notice as $t) { $key_t++; $is_first=$key_t==0 ? 1 : 0;$is_last=$count_t==$key_t+1 ? 1 : 0;?>
                                        <div class="d-flex flex-stack py-4">
                                            <!--begin::Section-->
                                            <div class="d-flex align-items-center">
                                                <div class="symbol symbol-35px me-4">
                                                <span class="symbol-label bg-light-primary">
                                                    <span class="svg-icon svg-icon-2 svg-icon-primary">
                                                    <img style="height: 25px!important;" src="<?php echo dr_avatar($t['uid']); ?>" />
                                                    </span>
                                                </span>
                                                </div>
                                                <div class="mb-0 me-2">
                                                    <a href="javascript:dr_go_url('<?php echo dr_url('api/notice', array('id' => $t['id'])); ?>');" class="fs-6 text-gray-800 text-hover-primary "><?php echo $t['msg']; ?></a>

                                                </div>
                                            </div>
                                            <span class="badge badge-light fs-8"><?php echo dr_fdate($t['inputtime']); ?></span>
                                        </div>
                                        <?php } } ?>

                                    </div>
                                    <div class="py-2 text-center border-top">
                                        <a href="javascript:dr_go_url('<?php echo dr_url('notice/index'); ?>');" class="btn btn-color-gray-600 btn-active-color-primary"><?php echo dr_lang('更多'); ?></a>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>


                            <div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
                                <div class="cursor-pointer symbol symbol-30px symbol-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                    <img src="<?php echo dr_avatar($admin['uid']); ?>" alt="<?php echo $admin['username']; ?>">
                                </div>
                                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-200px" data-kt-menu="true">
                                    <div class="menu-item px-3">
                                        <div class="menu-content d-flex align-items-center px-3">
                                            <div class="symbol symbol-50px me-5">
                                                <img src="<?php echo dr_avatar($admin['uid']); ?>" alt="<?php echo $admin['username']; ?>">
                                            </div>
                                            <div class="d-flex flex-column">
                                                <div class="fw-bolder d-flex align-items-center fs-5"><?php echo $admin['username']; ?></div>
                                                <?php if (isset($admin['role']) && is_array($admin['role']) && $admin['role']) { $key_rr=-1;$count_rr=dr_count($admin['role']);foreach ($admin['role'] as $rr) { $key_rr++; $is_first=$key_rr==0 ? 1 : 0;$is_last=$count_rr==$key_rr+1 ? 1 : 0;?>
                                                <span class="fw-bold text-muted text-hover-primary fs-7"><?php echo $rr; ?></span>
                                                <?php } } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="separator my-2"></div>
                                    <?php if (IS_USE_MEMBER) { ?>
                                    <div class="menu-item px-5">
                                        <a href="<?php echo dr_url('api/alogin', ['id'=>$admin['uid']]); ?>" target="_blank" class="menu-link px-5"><i class="fa fa-user"></i>  <?php echo dr_lang('用户中心'); ?></a>
                                    </div>
                                    <?php } ?>
                                    <div class="menu-item px-5">
                                        <a href="javascript:dr_go_url('<?php echo dr_url('api/my'); ?>');" class="menu-link px-5"> <i class="fa fa-edit"></i> <?php echo dr_lang('修改资料'); ?></a>
                                    </div>
                                    <div class="menu-item px-5">
                                        <a href="<?php echo dr_url('api/admin_min'); ?>" class="menu-link px-5"><i class="fa fa-retweet"></i>  <?php echo dr_lang('简化模式'); ?></a>
                                    </div>
                                    <div class="menu-item px-5">
                                        <a href="javascript:;" onClick="dr_logout('<?php echo dr_url('login/out'); ?>');" class="menu-link px-5"><i class="fa fa-user-times"></i> <?php echo dr_lang('退出系统'); ?></a>
                                    </div>
                                    <div class="separator my-2"></div>
                                    <?php if ($ci->_is_admin_auth('cache/index')) { ?>
                                    <div class="menu-item px-5">
                                        <a href="javascript:dr_go_url('<?php echo dr_url('cache/index'); ?>');" class="menu-link px-5"><i class="fa fa-cogs"></i>  <?php echo dr_lang('系统更新'); ?></a>
                                    </div>
                                    <?php }  if ($ci->_is_admin_auth('check/index')) { ?>
                                    <div class="menu-item px-5"><a href="javascript:dr_go_url('<?php echo dr_url('check/index'); ?>');" class="menu-link px-5"><i class="fa fa-wrench"></i>  <?php echo dr_lang('系统体检'); ?></a></div>
                                    <?php } ?>
                                    <div class="menu-item px-5"><a href="javascript:dr_update_cache_all();" class="menu-link px-5"><i class="fa fa-refresh"></i>  <?php echo dr_lang('更新缓存'); ?></a></div>
                                    <div class="menu-item px-5"><a href="javascript:dr_update_cache_data();" class="menu-link px-5"><i class="fa fa-trash"></i>  <?php echo dr_lang('更新数据'); ?></a></div>
                                    <?php if ($admin['adminid']==1) { ?>
                                    <div class="separator my-2"></div>
                                    <div class="menu-item px-5"><a href="javascript:dr_go_url('<?php echo dr_url('error/index'); ?>');" class="menu-link px-5"><i class="fa fa-shield"></i>  <?php echo dr_lang('系统日志'); ?></a></div>
                                    <?php }  if ($is_search_help) { ?>
                                    <div class="menu-item px-5"><a href="http://help.xunruicms.com" target="_blank" class="menu-link px-5"><i class="fa fa-book"></i>  <?php echo dr_lang('帮助手册'); ?></a></div>
                                    <?php } ?>

                                </div>
                            </div>

                        </div>

                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::Header-->

            <!--begin::Content-->
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content" style="padding: 0;border-top: 1px solid #eff2f5;">

                <div id="myiframe" cid="right_page">
                    <iframe class="myiframe active" name="right" id="right_page" src="<?php echo $main_url; ?>" url="<?php echo $main_url; ?>" style="border:none; margin-bottom:0px;" width="100%" height="auto" allowtransparency="true"></iframe>
                </div>

            </div>
            <!--end::Content-->
            <!--begin::Footer-->

            <!--end::Footer-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Page-->
</div>
<!--end::Root-->


<script>
    if (self != top) {
        top.location.href = admin_file;
    }
    var url = '<?php echo dr_url_prefix('/'); ?>';
    var p = url.split('/');
    var ptl = document.location.protocol;
    if ((p[0] == 'http:' || p[0] == 'https:') && ptl != p[0]) {
        Swal.fire({
            text: '当前访问是'+ptl.replace(':', '')+'模式，本项目设置的是'+p[0].replace(':', '')+'模式，请使用'+p[0].replace(':', '')+'模式访问，会导致部分功能无法正常使用',
            icon: "error",
            buttonsStyling: !1,
            confirmButtonText: "<?php echo dr_lang('关闭'); ?>",
            customClass: {
                confirmButton: "btn btn-light"
            }
        });
    }
    // 添加快捷菜单
    function dr_add_menu() {
        var index = layer.load(2, {
            shade: [0.3,'#fff'], //0.1透明度的白色背景
            time: 5000
        });
        var obj = $('#myiframe').attr('cid');
        $.ajax({
            type: "GET",
            url: admin_file+"?c=api&m=menu&v="+encodeURIComponent($("#"+obj).attr("url")),
            dataType: "json",
            success: function (json) {
                layer.close(index);
                dr_tips(json.code, json.msg);
                if (json.code == 1) {
                    $('#dr_link_menu').html(json.data);
                }
            },
            error: function(HttpRequest, ajaxOptions, thrownError) {
                dr_ajax_admin_alert_error(HttpRequest, ajaxOptions, thrownError);
            }
        });
    }
</script>
<!--end::Modals-->
</body>
<!--end::Body-->
</html>