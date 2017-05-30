<script type="text/javascript">     function viewed(replied_forum, viewed_forum) {        var view = document.getElementById(viewed_forum);        var reply = document.getElementById(replied_forum);                reply.style.display = 'none';        view.style.display = 'block';    }    function replied(viewed_forum, replied_forum){        var view = document.getElementById(viewed_forum);        var reply = document.getElementById(replied_forum);            view.style.display = 'none';        reply.style.display = 'block';    }    en4.core.runonce.add(function () {        $("viewh").addEvent('click', function(){            $("viewh").addClass('active');            $("replyh").removeClass('active');        });        $("replyh").addEvent('click', function(){            $("replyh").addClass('active');            $("viewh").removeClass('active');        });    });</script><div id="Gp_newsgz">    <div id="news_wrapper">        <div id="newsgz">            <div id="left_news">                <h1><b><?php echo $this->blogs_head; ?></b></h1>                <?php if ($this->blogs->getTotalItemCount() <= 0): ?>                    <div class="newsarticle">                        <p class="auther">                            There are no blogs yet                        </p>                    </div>                <?php endif; ?>                <?php foreach( $this->blogs as $item ): ?>                <div class="newsarticle">                    <?php echo $this->htmlLink($item->getHref(), $this->itemPhoto($item)); ?>                    <div class="enc_gz_news_desc">                        <h1 class="artcle_title">                            <?php echo $this->htmlLink($item->getHref(), $item->getTitle()) ?>                        </h1>                    <p class="auther">By                         <a class="auther_name">                            <?php $owner = $item->getOwner();                            echo $this->htmlLink($owner->getHref(), $owner->getTitle());                            //echo $this->htmlLink($owner->getHref(), $this->itemPhoto($owner)); ?>                        </a> on                        <i class="date_time">                            <?php echo $this->timestamp($item->creation_date) ?>                        </i>                    </p>                    <p class="article_p">                        <?php echo $this->string()->truncate($this->string()->stripTags($item->body), 200) ?>                    </p>                    <div class="article_misc">                    <a class="read_more more" href="<?php echo $item->getHref(); ?>">                        Read More                    </a>                    <a class="read_more comments_fa" href="<?php echo $item->getHref(); ?>">                        <i class="fa fa-eye" aria-hidden="true">                            <?php echo $item->view_count; ?>                        </i>                    </a>                    </div>                    </div>                </div>                <?php endforeach; ?>                <div id="left_news_posting">                    <span id="left_news_post">                        <a href="/blogs"> <p>Blog Posts</p> </a>                    </span>                </div>            </div>            <div id="wrap_right_news">                <div id="wrap_rising">                    <div id="right_news">                        <div id="right_news_headings">                            <h1 id="viewh" onClick="viewed('replied_forum', 'viewed_forum')" class="active"><?php echo $this->heading_viewed; ?></h1>                            <h2 id="replyh" onClick="replied('viewed_forum', 'replied_forum')"><?php echo $this->heading_replied; ?></h2>                        </div>                        <ul id="viewed_forum">                            <?php if ($this->forum_topics->getTotalItemCount() <= 0): ?>                                <li class="rising">                                    <div class="rising_info_all">                                        <p class="rising_title">                                            There are no forums yet                                        </p>                                    </div>                                </li>                            <?php endif; ?>                            <?php foreach( $this->forum_topics as $topic ):                            $user = $topic->getOwner('user');                            $forum = $topic->getParent();                            ?>                            <li class="rising">                                <!--<img src="/public/admin/dues.jpg">-->                                <?php echo $this->htmlLink($topic->getOwner()->getHref(), $this->itemPhoto($topic->getOwner(), 'thumb.icon')); ?>                                <div class="rising_info_all">                                    <p class="rising_title">                                        <a>                                            <?php echo $this->htmlLink($topic->getHref(), $topic->getTitle()) ?>                                        </a>                                    </p>                                    <p class="genre">                                        <?php echo $this->translate('By') ?>                                        <?php echo $this->htmlLink($user->getHref(), $this->translate($user->getTitle())) ?>                                    </p>                                    <p class="platform_p">                                        <?php echo $this->translate('In') ?>                                        <?php echo $this->htmlLink($forum->getHref(), $this->translate($forum->getTitle())) ?>                                        <a href=""></a>                                    </p>                                    <br>                                    <p class="most_viewed v_active">                                        &nbsp;&nbsp;                                        <?php echo $this->translate('viewed') ?>                                        <?php echo $topic->view_count; ?>                                        <?php echo $this->translate('times') ?>                                    </p>                                </div>                            </li>                            <?php endforeach; ?>                        </ul>                                                <ul id="replied_forum" style="display: none">                            <?php if ($this->forum_replied->getTotalItemCount() <= 0): ?>                                <li class="rising">                                    <div class="rising_info_all">                                        <p class="rising_title">                                            There are no forums yet                                        </p>                                    </div>                                </li>                            <?php endif; ?>                            <?php foreach( $this->forum_replied as $replied ):                            $user = $replied->getOwner('user');                            $forum = $replied->getParent();                            ?>                            <li class="rising">                                <!--<img src="/public/admin/dues.jpg">-->                                <?php echo $this->htmlLink($replied->getOwner()->getHref(), $this->itemPhoto($replied->getOwner(), 'thumb.icon')); ?>                                <div class="rising_info_all">                                    <p class="rising_title">                                        <a>                                            <?php echo $this->htmlLink($replied->getHref(), $replied->getTitle()) ?>                                        </a>                                    </p>                                    <p class="genre">                                        <?php echo $this->translate('By') ?>                                        <?php echo $this->htmlLink($user->getHref(), $this->translate($user->getTitle())) ?>                                    </p>                                    <p class="platform_p">                                        <?php echo $this->translate('In') ?>                                        <?php echo $this->htmlLink($forum->getHref(), $this->translate($forum->getTitle())) ?>                                        <a href=""></a>                                    </p>                                    <br>                                    <p class="most_viewed">                                        &nbsp;&nbsp;                                        <?php echo $this->translate('replied') ?>                                        <?php echo $replied->post_count; ?>                                        <?php echo $this->translate('times') ?>                                    </p>                                </div>                            </li>                            <?php endforeach; ?>                        </ul>                    </div>                </div>                                <div class="right_side_landing_ad">                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>                    <!-- Landing Page Right 300 x 600 Large Skyscraper -->                    <ins class="adsbygoogle"                         style="display:inline-block;width:300px;height:600px"                         data-ad-client="ca-pub-4061361351337345"                         data-ad-slot="7050981711"></ins>                    <script>                    (adsbygoogle = window.adsbygoogle || []).push({});                    </script>                </div>                            </div>        </div>    </div></div>