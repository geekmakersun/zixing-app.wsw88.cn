<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8" />
    <title><?php echo dr_lang('%s - 后台管理平台', SITE_NAME); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="<?php echo $THEME_PATH; ?>assets/global/css/plugins.bundle<?php if (!IS_XRDEV) { ?>.min<?php } ?>.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $THEME_PATH; ?>assets/icon/css/icon.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
</head>
<body id="kt_body" class=" header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed  ">

<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="post d-flex flex-column-fluid" id="kt_post">
                    <div id="kt_content_container" class="container-xxl">
                            <div class="card" style="<?php if (IS_PC) { ?>margin-top: 50px<?php } ?>">
                                <div class="card-body p-0">
                                    <div class="card-px text-center py-20 my-10">
                                        <h2 class="fs-md-5x fw-bolder mb-10">
                                            <?php if ($mark==1) { ?>
                                            <i class="fa fa-check-circle-o link-primary"></i>
                                            <?php } else if ($mark==2) { ?>
                                            <i class="fa fa-info-circle "></i>
                                            <?php } else { ?>
                                            <i class="fa fa-times-circle-o link-danger"></i>
                                            <?php } ?>
                                        </h2>
                                        <p class="text-gray-400 fs-2 fw-bold mb-10">
                                            <?php echo $msg; ?>
                                        </p>
                                        <?php if ($url) { ?>
                                        <a href="<?php echo $url; ?>" class="btn btn-primary"><?php echo dr_lang('即将跳转'); ?></a>
                                        <meta http-equiv="refresh" content="<?php echo $time; ?>; url=<?php echo $url; ?>">
                                        <?php } else if ($backurl) { ?>
                                        <a href="<?php echo $backurl; ?>" class="btn btn-light"><?php echo dr_lang('点击返回上一页'); ?></a>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo $THEME_PATH; ?>assets/global/scripts/plugins.bundle.js"></script>
</body>
</html>