<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>

<!--begin::Page title-->
<div class="page-title d-flex flex-column justify-content-center flex-wrap mt-5">
    <!--begin::Breadcrumb-->
    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
        <!--begin::Item-->
        <li class="breadcrumb-item text-muted">
            <a href="/" class="text-muted text-hover-primary">首页</a>
        </li>
        <!--end::Item-->
        <?php echo dr_catpos($catid, '', true, '<li class="breadcrumb-item"><span class="bullet bg-gray-400 w-5px h-2px"></span></li><li class="breadcrumb-item text-muted">'.PHP_EOL.' <a href="[url]" class="text-muted text-hover-primary">[name]</a> '.PHP_EOL.' </li>'.PHP_EOL); ?>

        <!--begin::Item-->
        <li class="breadcrumb-item">
            <span class="bullet bg-gray-400 w-5px h-2px"></span>
        </li>
        <!--end::Item-->
        <!--begin::Item-->
        <li class="breadcrumb-item text-muted">列表</li>
        <!--end::Item-->
    </ul>
    <!--end::Breadcrumb-->
</div>
<!--end::Page title-->

<div class="row g-5 g-xl-10 mb-5 mb-xl-10 mt-5">

    <!--begin::Col-->
    <div class="col-xl-8 mt-0">
        <!--begin::Table widget 14-->
        <div class="card card-flush h-md-100">

            <!--begin::Header-->
            <div class="card-header pt-5">
                <!--begin::Title-->
                <h3 class="card-title align-items-start flex-column">
                    <div class="d-flex align-items-center mb-2">
                        <!--begin::Currency-->
                        <span class="fs-5 fw-bold text-gray-800 "><?php echo $cat['name']; ?></span>
                        <!--end::Currency-->
                    </div>
                </h3>
                <!--end::Title-->
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div data-action="list" class="tpl-edit-show card-body pt-6">


                    <!--分页显示列表数据-->
                    <?php $list_return = $this->list_tag("action=module catid=$catid order=updatetime page=1"); if ($list_return && is_array($list_return)) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return) && $return) { $key=-1; foreach ($return as $t) { $key++; $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
                        <div class=" d-flex align-items-center  p-lg-3">
                            <!--begin::Icon-->
                            <div class="mobile-hidden d-flex h-120px w-120px h-lg-120px w-lg-120px flex-shrink-0 flex-center position-relative align-self-start align-self-lg-center mt-3 mt-lg-0">
                                <div class="symbol symbol-90px symbol-2by3 me-4">
                                    <div class="symbol-label" style="background-image: url('<?php echo dr_thumb($t['thumb']); ?>')"></div>
                                </div>
                            </div>
                            <!--end::Icon-->

                            <!--begin::Description-->
                            <div class="ms-6">
                                <h5 class="article-title">
                                    <a href="<?php echo $t['url']; ?>" class="text-dark"><?php echo $t['title']; ?></a>
                                </h5>
                                <p class="list-unstyled text-gray-600 fw-semibold fs-6 p-0 m-0">
                                    <?php echo dr_strcut($t['description'], 80); ?>
                                </p>
                                <div class="article-tag">
                                    <?php $kws=dr_get_content_kws($t['keywords'], MOD_DIR);  if ($kws) {  $kws=dr_arraycut($kws, 3);  if (isset($kws) && is_array($kws) && $kws) { $key_url=-1;$count_url=dr_count($kws);foreach ($kws as $name=>$url) { $key_url++; $is_first=$key_url==0 ? 1 : 0;$is_last=$count_url==$key_url+1 ? 1 : 0; ?>
                                    <a href="<?php echo $url; ?>" class="badge badge-light-primary fw-bold my-2"><?php echo $name; ?></a>
                                    <?php } }  } ?>

                                    <span class="text-muted   mx-2 fs-7"><i class="fa fa-calendar"></i> <?php echo $t['updatetime']; ?></span>
                                    <span class="text-muted  mx-2  fs-7" itemprop="comments"><i class="fa fa-comments"></i> <?php echo intval($t['comments']); ?> </span>
                                    <span class="text-muted  mx-2  fs-7" itemprop="views" title="浏览次数"><i class="fa fa-eye"></i> <?php echo intval($t['hits']); ?> </span>
                                </div>
                            </div>
                            <!--end::Description-->
                        </div>
                    <?php } } ?>

                    <div class="row ">
                        <div class="xrpagination mt-5">
                            <?php echo $pages; ?>
                        </div>
                    </div>


            </div>
            <!--end: Card Body-->
        </div>
        <!--end::Table widget 14-->
    </div>
    <!--end::Col-->

    <!--begin::Col-->
    <div class="col-xl-4 mt-0">
        <!--begin::Chart Widget 35-->
        <div data-action="cat_hits" class="tpl-edit-show card card-flush h-md-100">
            <!--begin::Header-->
            <div class="card-header pt-5 ">
                <!--begin::Title-->
                <h3 class="card-title align-items-start flex-column">
                    <!--begin::Statistics-->
                    <div class="d-flex align-items-center mb-2">
                        <!--begin::Currency-->
                        <span class="fs-5 fw-bold text-gray-800 ">热门资讯</span>
                        <!--end::Currency-->
                    </div>
                    <!--end::Statistics-->
                </h3>
                <!--end::Title-->
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body pt-3">

                <?php $list_return = $this->list_tag("action=module catid=$catid order=hits num=10"); if ($list_return && is_array($list_return)) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return) && $return) { $key=-1; foreach ($return as $t) { $key++; $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
                <!--begin::Item-->
                <div class="d-flex flex-stack mb-7">
                    <!--begin::Symbol-->
                    <div class="symbol symbol-60px symbol-2by3 me-4">
                        <div class="symbol-label" style="background-image: url('<?php echo dr_thumb($t['thumb']); ?>')"></div>
                    </div>
                    <!--end::Symbol-->
                    <!--begin::Title-->
                    <div class="m-0">
                        <a href="<?php echo $t['url']; ?>" class="text-dark fw-bold text-hover-primary fs-6"><?php echo dr_strcut($t['title'], 15); ?></a>
                        <span class="text-gray-600 fw-semibold d-block pt-1 fs-7"><?php echo dr_strcut($t['description'], 50); ?></span>
                    </div>
                    <!--end::Title-->
                </div>
                <?php } } ?>

            </div>
            <!--end::Body-->
        </div>
        <!--end::Chart Widget 35-->
    </div>
    <!--end::Col-->
</div>

<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>