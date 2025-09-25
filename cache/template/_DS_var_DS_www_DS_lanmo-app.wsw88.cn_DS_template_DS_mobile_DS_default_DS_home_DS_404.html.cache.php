<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
<header class="hui-header">
    <div id="hui-back"></div>
    <h1>404错误</h1>
    <a id="hui-search" href="javascript:dr_m_top_search();"><i class="fa fa-search"></i></a>
</header>
<div class="hui-header-line"></div>

<div class="page-content">

    <div class="text-center fc-msg-body">



        <div class="fc-msg-info">
            <label class="fc-msg-title"><?php echo $msg; ?></label>
        </div>



    </div>

</div>



<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>