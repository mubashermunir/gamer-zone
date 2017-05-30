<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Blog
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: Controller.php 9747 2012-07-26 02:08:08Z john $
 * @author     John Boehr <john@socialengine.com>
 */

/**
 * @category   Application_Extensions
 * @package    Blog
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 */
class Blog_Widget_ProfileBodyController extends Engine_Content_Widget_Abstract
{
  public function indexAction()
  {
      error_reporting(E_ALL);
ini_set('display_errors', 1);
    // Only blog or user as subject
    if( Engine_Api::_()->core()->hasSubject('blog') ) {
      $this->view->blog = $blog = Engine_Api::_()->core()->getSubject('blog');
      $this->view->owner = $owner = $blog->getOwner();
    }else{
      return $this->setNoRender();
    }
    
    //check if the device is real mobile device or not
    $this->view->plugin = $plugin = new Blog_Plugin_Mobile();
    
    $this->view->mobihtml = $htmlMobi = $this->_getParam('mobihtml', NULL);
    $this->view->mobihtml2 = $htmlMobi2 = $this->_getParam('mobihtml2', NULL);
    $this->view->sitehtml = $htmlSite = $this->_getParam('sitehtml', NULL);
     
    
  }
}
