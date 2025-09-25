<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title><?php echo $meta_title; ?></title>
    <meta content="<?php echo $meta_keywords; ?>" name="keywords" />
    <meta content="<?php echo $meta_description; ?>" name="description" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="<?php echo HOME_THEME_PATH; ?>pc/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo HOME_THEME_PATH; ?>pc/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>assets/icon/css/icon.css" rel="stylesheet" type="text/css" />
    <!-- 系统懒人版js(所有自建模板引用) -->
    <script type="text/javascript">var is_mobile_cms = '<?php echo IS_MOBILE; ?>';var web_dir = '<?php echo WEB_DIR; ?>';</script>
    <script src="<?php echo LANG_PATH; ?>lang.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/js/cms.js" type="text/javascript"></script>
    <!-- 系统懒人版js结束 -->
</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" class="auth-bg bgi-size-cover bgi-position-center bgi-no-repeat">

		<div class="d-flex flex-column flex-root">
			
			<!--begin::Authentication - Signup Welcome Message -->
			<div class="d-flex flex-column flex-center flex-column-fluid">
				<!--begin::Content-->
				<div class="d-flex flex-column flex-center text-center p-10">
					<!--begin::Wrapper-->
					<div class="card card-flush w-lg-650px py-5">
						<div class="card-body py-15 py-lg-20">
						    
					
							<div class="py-10">
							<?php if ($code) { ?>
                            <i class="fs-5hx fa fa-check fc-msg-icon font-green-sharp"></i>
                            <?php } else { ?>
                            <i class=" fs-5hx fa fa-close fc-msg-icon"></i>
                            <?php } ?>
                            </div>
					
					
        					<h5 class="fw-bolder text-gray-900 mb-4"><?php echo $msg; ?></h5>
        					
        					<div class="fw-semibold fs-6 text-gray-500 mb-7">
        					<?php if ($url) { ?>
                                <a href="<?php echo $url; ?>">如果您的浏览器没有自动跳转，请点击这里</a>
                                <meta http-equiv="refresh" content="<?php echo $time; ?>; url=<?php echo $url; ?>">
                                <?php } else { ?>
                                <a href="<?php echo $backurl; ?>" >[点击返回上一页]</a>
                                <?php } ?>
        					</div>
							
							
						</div>
					</div>
					<!--end::Wrapper-->
				</div>
				<!--end::Content-->
			</div>
			<!--end::Authentication - Signup Welcome Message-->
		</div>
		<!--end::Root-->
		<!--end::Main-->
        <script>var hostUrl = "<?php echo HOME_THEME_PATH; ?>pc/";</script>
        <!--begin::Global Javascript Bundle(mandatory for all pages)-->
        <script src="<?php echo HOME_THEME_PATH; ?>pc/plugins/global/plugins.bundle.js"></script>
        <script src="<?php echo HOME_THEME_PATH; ?>pc/js/scripts.bundle.js"></script>
        <!--end::Global Javascript Bundle-->
	</body>
	<!--end::Body-->
</html>