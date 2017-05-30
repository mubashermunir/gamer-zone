<style>
    .sliding_imgs_bottom:hover span.opc_targets {
        opacity: 1 !important;
    }
    span.opc_targets {
        transition: opacity 0.4s;
        background: rgba(0, 0, 0, 0.39);
        width: 100%;
        height: 100%;
    }
    .sliding_imgs_bottom {
        width: 100%;
        height: 100%;
    }
    span.opc_targets > div {
        transition: opacity 0.4s;
    }
</style>
<link rel="stylesheet" type="text/css" href="<?php echo Zend_Controller_Front::getInstance()->getBaseUrl() ?>/application/themes/cb-gamerzone/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo Zend_Controller_Front::getInstance()->getBaseUrl() ?>/application/themes/cb-gamerzone/css/slick-theme.css"/>
<div id="wrap_footerslider">
    <div class="autoplay">
        <?php if($this->carousel_opt == 1): ?>
        <?php foreach( $this->albums as $album_item ): ?>
        <a href="<?php echo $album_item->getHref() ?>">
            <div class="sliding_imgs_bottom" style="position: relative">
                <span class="opc_targets" style="opacity:0;position: absolute;">
                    <div>
                        <?php if(!empty($album_item->getTitle())): ?>
                        <h3>
                            <?php echo $album_item->getTitle() ?>
                        </h3>
                        <?php endif; ?>
                        <p>
                            <?php echo $this->string()->truncate($this->string()->stripTags($album_item->description), 120) ?>
                        </p>
                    </div>
                </span>
                <?php echo $this->itemPhoto($album_item, 'thumb.main') ?>
            </div>
        </a>
        <?php endforeach; ?>
        <?php endif; ?>
        <?php if($this->carousel_opt == 2): ?>
        <?php foreach( $this->classifieds as $classf_item ): ?>
        <a href="<?php echo $classf_item->getHref() ?>">
            <div class="sliding_imgs_bottom" style="position: relative">
                <span class="opc_targets" style="opacity:0;position: absolute;">
                    <div>
                        <?php if(!empty($classf_item->getTitle())): ?>
                        <h3>
                            <?php echo $classf_item->getTitle() ?>
                        </h3>
                        <?php endif; ?>
                        <p>
                            <?php echo $this->string()->truncate($this->string()->stripTags($classf_item->body), 120) ?>
                        </p>
                    </div>
                </span>
                <?php echo $this->itemPhoto($classf_item, 'thumb.main') ?>
            </div>
        </a>
        <?php endforeach; ?>
        <?php endif; ?>
        <?php if($this->carousel_opt == 3): ?>
        <?php foreach( $this->events as $events_item ): ?>
        <a href="<?php echo $events_item->getHref() ?>">
            <div class="sliding_imgs_bottom" style="position: relative">
                <span class="opc_targets" style="opacity:0;position: absolute;">
                    <div>
                        <?php if(!empty($events_item->getTitle())): ?>
                        <h3>
                            <?php echo $events_item->getTitle() ?>
                        </h3>
                        <?php endif; ?>
                        <p>
                            <?php echo $this->string()->truncate($this->string()->stripTags($events_item->description), 120) ?>
                        </p>
                    </div>
                </span>
                <?php echo $this->itemPhoto($events_item, 'thumb.main') ?>
            </div>
        </a>
        <?php endforeach; ?>
        <?php endif; ?>
        <?php if($this->carousel_opt == 4): ?>
        <?php foreach( $this->groups as $group_item ): ?>
        <a href="<?php echo $group_item->getHref() ?>">
            <div class="sliding_imgs_bottom" style="position: relative">
                <span class="opc_targets" style="opacity:0;position: absolute;">
                    <div>
                        <?php if(!empty($group_item->getTitle())): ?>
                        <h3>
                            <?php echo $group_item->getTitle() ?>
                        </h3>
                        <?php endif; ?>
                        <p>
                            <?php echo $this->string()->truncate($this->string()->stripTags($group_item->description), 120) ?>
                        </p>
                    </div>
                </span>
                <?php echo $this->itemPhoto($group_item, 'thumb.main') ?>
            </div>
        </a>
        <?php endforeach; ?>
        <?php endif; ?>
        <?php if($this->carousel_opt == 5): ?>
        <?php foreach( $this->photos as $photo_item ): ?>
        <a href="<?php echo $photo_item->getHref() ?>">
            <div class="sliding_imgs_bottom" style="position: relative">
                <span class="opc_targets" style="opacity:0;position: absolute;">
                    <div>
                        <?php if(!empty($photo_item->getTitle())): ?>
                        <h3>
                            <?php echo $photo_item->getTitle() ?>
                        </h3>
                        <?php endif; ?>
                        <p>
                            <?php echo $this->string()->truncate($this->string()->stripTags($photo_item->description), 120) ?>
                        </p>
                    </div>
                </span>
                <?php echo $this->itemPhoto($photo_item, 'thumb.main') ?>
            </div>
        </a>
        <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>
<script type="text/javascript" src="<?php echo Zend_Controller_Front::getInstance()->getBaseUrl() ?>/application/themes/cb-gamerzone/js/slick.js"></script>
<script type="text/javascript" src="<?php echo Zend_Controller_Front::getInstance()->getBaseUrl() ?>/application/themes/cb-gamerzone/js/slick.min.js"></script>
<script>
    jQuery.noConflict();
    jQuery(document).ready(function () {
        jQuery('.autoplay').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 2000,
        });
    });
</script>