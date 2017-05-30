<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Blog
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @author     Jung
 */
 
 //require_once 'htmlpurify/library/HTMLPurifier.auto.php';
?>

<h2>
  <?php echo $this->blog->getTitle() ?>
</h2>
<ul class='blogs_entrylist'>
  <li>
    <div class="blog_entrylist_entry_date">
      <?php echo $this->translate('Posted by');?> <?php echo $this->htmlLink($this->owner->getHref(), $this->owner->getTitle()) ?>
      <?php echo $this->timestamp($this->blog->creation_date) ?>
      <?php if( $this->category ): ?>
        -
        <?php echo $this->translate('Filed in') ?>
        <a href='javascript:void(0);' onclick='javascript:categoryAction(<?php echo $this->category->category_id?>);'><?php echo $this->translate($this->category->category_name) ?></a>
      <?php endif; ?>
      <?php if (count($this->blogTags )):?>
        -
        <?php foreach ($this->blogTags as $tag): ?>
          <a href='javascript:void(0);' onclick='javascript:tagAction(<?php echo $tag->getTag()->tag_id; ?>);'>#<?php echo $tag->getTag()->text?></a>&nbsp;
        <?php endforeach; ?>
      <?php endif; ?>
      -
      <?php echo $this->translate(array('%s view', '%s views', $this->blog->view_count), $this->locale()->toNumber($this->blog->view_count)) ?>
      
      <div class="fb_like_wrapper">
          <div class="fb-like" data-layout="button_count" data-action="like" data-size="large" data-show-faces="false" data-share="false"></div>
      </div>
      
    </div>
      <?php 

        $article = $this->blog;
        
        $body = $article->body;
        //$config = HTMLPurifier_Config::createDefault();
        //$config->set('Core.Encoding', 'UTF-8');
        //$config->set('AutoFormat.AutoParagraph', true);
        //$purifier = new HTMLPurifier($config);
        //$body = $purifier->purify($body);
        $body = preg_replace('#<p[^>]*>(\s|&nbsp;?)*</p>#', '', $body);
        
        $length = strlen($body);

        $htmlMobi = $this->mobihtml; 
        $htmlMobi2 = $this->mobihtml2; 
        $htmlSite = $this->sitehtml; 

        $mobile = $_SESSION['mobile']['mobile'];

        if(!empty($htmlSite) && $mobile != 1 ){ 

        if($length > 300):

          echo "<div class='blog_entrylist_entry_body rich_content_body'>";
          $explode = explode('</p>',$body);

          //find the last p which is not img/iframe or empty
          $pNum = 0; $pj=0;
          foreach($explode as $ps){
              $pj++;
              $ps = trim($ps);
              if( !empty($ps) ){
                  if(strpos($ps, 'img') === false){
                      if(strpos($ps, 'iframe') === false){
                          if(strpos($ps, 'https://clousc.com/player.php') === false){
                              $pNum = $pj;
                          }
                      }
                  }
              }
          }

          if(count($explode ) >= 4):

            $i = 0;
            foreach($explode as $part):

              if($i == 4):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi; 
                }else{
                  echo $htmlSite; 
                } 
                echo '</div>';
              endif;

              if($i == 5):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi2; 
                } 
                echo '</div>';
              endif;



              echo $part;


              $i++;
            endforeach;

          else:


            $i = 0;
            foreach($explode as $part):

              if($i == 2):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi; 
                }else{
                  echo $htmlSite; 
                } 
                echo '</div>';
              endif;

              if($i == 5):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi2; 
                }
                echo '</div>';
              endif;


              echo $part;



              $i++;
            endforeach;

          endif;

          echo '</div>';

        else:
          echo "<div class='blog_entrylist_entry_body rich_content_body'>";
          echo $body;

          echo '<div class="ad_btw_article">';
          if($this->plugin->isMobile()){ 
            echo $htmlMobi; 
          }else{
            echo $htmlSite; 
          } 
          echo '</div>';
          echo '</div>';
        endif;


        }elseif( (!empty($htmlMobi) || !empty($htmlMobi2)) && $mobile == 1 ){ 

        if($length > 300):

          echo "<div class='blog_entrylist_entry_body rich_content_body'>";
          $explode = explode('</p>',$body);

          //echo "<div class='blog_entrylist_entry_body rich_content_body'>";
          $explode = explode('</p>',$body);

          //find the last p which is not img/iframe or empty
          $pNum = 0; $pj=0;
          foreach($explode as $ps){
              $pj++;
              $ps = trim($ps);
              if( !empty($ps) ){
                  if(strpos($ps, 'img') === false){
                      if(strpos($ps, 'iframe') === false){
                          if(strpos($ps, 'https://clousc.com/player.php') === false){
                              $pNum = $pj;
                          }
                      }
                  }
              }
          }

          if(count($explode ) >= 4):

            $i = 0;
            foreach($explode as $part):

              if($i == 2):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi; 
                }else{
                  echo $htmlSite; 
                } 
                echo '</div>';
              endif;

              if($i == 5):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi2; 
                }
                echo '</div>';
              endif;
              
              echo $part;
              $i++;
            endforeach;

          else:


            $i = 0;
            foreach($explode as $part):

              if($i == 2):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi; 
                }else{
                  echo $htmlSite; 
                } 
                echo '</div>';
              endif;

              if($i == 5):
                echo '<div class="ad_btw_article">';
                if($this->plugin->isMobile()){ 
                  echo $htmlMobi2; 
                }
                echo '</div>';
              endif;

              echo $part;


              $i++;
            endforeach;

          endif;

          echo '</div>';

        else:

          echo "<div class='blog_entrylist_entry_body rich_content_body'>";
          echo $body;
          echo '<div class="ad_btw_article">';
          if($this->plugin->isMobile()){ 
            echo $htmlMobi; 
          }else{
            echo $htmlSite; 
          } 
          echo '</div>';
          echo '</div>';
        endif;


        }else{ ?>
        <div class='blog_entrylist_entry_body rich_content_body'>
          <?php echo $article->body; ?>
        </div>
      <?php } ?>

      <script type="text/javascript">
          en4.core.runonce.add(function(){
            var article = encodeURIComponent(window.location.href);
            var url = 'https://graph.facebook.com/?id='+article+'&scrape=true';
            var req = new Request.JSON({
              url : url,
              onComplete : function(responseJSON) {
              }
            });
            req.send(); 
          });
      </script>
  </li>
</ul>


<script type="text/javascript">
  $$('.core_main_blog').getParent().addClass('active');
</script>
