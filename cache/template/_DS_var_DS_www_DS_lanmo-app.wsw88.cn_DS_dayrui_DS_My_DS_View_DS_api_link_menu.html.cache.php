<?php if ($admin['usermenu']) {  $admin['usermenu']=dr_arraycut(array_reverse($admin['usermenu']), 20); ?>
<div class="row g-0">
    <?php if (isset($admin['usermenu']) && is_array($admin['usermenu']) && $admin['usermenu']) { $key_t=-1;$count_t=dr_count($admin['usermenu']);foreach ($admin['usermenu'] as $t) { $key_t++; $is_first=$key_t==0 ? 1 : 0;$is_last=$count_t==$key_t+1 ? 1 : 0;?>
    <div class="col-6">
        <a  <?php if ($t['target']) { ?> href="<?php echo $t['url']; ?>" target="_blank" <?php } else { ?>href="javascript:dr_go_url('<?php echo $t['url']; ?>');"  <?php } ?> class="d-flex flex-column flex-center h-100 p-4 bg-hover-light border-end border-bottom ">
        <span class="fs-5 fw-bold text-gray-800 mb-0"><?php echo $t['name']; ?></span>
        </a>
    </div>
    <?php } } ?>
</div>
<?php } ?>