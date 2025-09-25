
<script>
    function dr_update_category_0() {
        dr_iframe_show('<?php echo dr_lang('一键更新栏目'); ?>', '<?php echo dr_url('module/api/update_category_repair'); ?>&all=1&mid=<?php echo $dir; ?>', '500px', '300px')
    }
    function dr_update_category_1() {
        dr_iframe_show('<?php echo dr_lang('栏目自定义字段'); ?>', '<?php echo dr_url('field/index'); ?>&is_menu=1&rname=category-<?php echo $dir; ?>', '80%', '90%')
    }
    function dr_update_category_2() {
        dr_iframe_show('<?php echo dr_lang('栏目字段权限划分'); ?>', '<?php echo dr_url(APP_DIR.'/category/field_add'); ?>', '80%', '90%')
    }
</script>

<?php if (APP_DIR!='module') { ?>
<label><a class="btn btn-sm green" href="<?php echo dr_url(APP_DIR.'/category/config_add'); ?>"> <?php echo dr_lang('栏目属性设置'); ?> </a></label>
<?php if ($ci->_is_admin_auth()) { ?>
<label><a class="btn btn-sm red"  onclick="dr_update_category_1()" href="javascript:;"> <?php echo dr_lang('栏目自定义字段'); ?> </a></label>
<label><a class="btn btn-sm yellow"  onclick="dr_update_category_2()" href="javascript:;"> <?php echo dr_lang('栏目字段权限'); ?> </a></label>
<label><a class="btn btn-sm green"  href="<?php echo dr_url(APP_DIR.'/category/table_add'); ?>"> <?php echo dr_lang('内容独立分表储存'); ?> </a></label>
<?php }  if (!APP_DIR && IS_XRDEV) { ?>
<label><a class="btn btn-sm red"  href="<?php echo dr_url(APP_DIR.'/category/domain_add'); ?>"> <?php echo dr_lang('栏目绑定域名'); ?> </a></label>
<?php }  } ?>
<label><a class="btn btn-sm blue" onclick="dr_update_category_0()" href="javascript:;"> <?php echo dr_lang('一键更新栏目'); ?> </a></label>
