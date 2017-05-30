<?php

class Cbthemegamerzone_Widget_GzLandingpagecarouselController extends Engine_Content_Widget_Abstract
{
  public function indexAction()
  {
    $this->view->carousel_opt = $carousel_opt = $this->_getParam('carousel_opt');
    $this->view->limit = $limit = $this->_getParam('carousel_limit');
    $this->view->photo_opt = $photo_opt = $this->_getParam('photos_opt');
    // Should we consider creation or modified recent?
    $recentType = $this->_getParam('recentType', 'creation');
    if( !in_array($recentType, array('creation', 'modified')) ) {
      $recentType = 'creation';
    }
    $this->view->recentType = $recentType;
    $this->view->recentCol = $recentCol = $recentType . '_date';
      
//======================================
//      ALBUMS
//======================================
      
    if($carousel_opt == 1) {
        // Get paginator
        $album_table = Engine_Api::_()->getItemTable('album');
        $alb_select = $album_table->select()
                ->where('photo_id != ?', 0);
        //  ->where('search = ?', true);
        if( $photo_opt == 1 ) {
            $alb_select->order('album_id DESC');
        } elseif ( $photo_opt == 2 ) {
            $alb_select->order('comment_count DESC');
        } elseif ( $photo_opt == 3 ) {
            $alb_select->order('view_count DESC');
        }

        // Create new array filtering out private albums
        $viewer = Engine_Api::_()->user()->getViewer();
        $album_select = $alb_select;
        $new_select = array();
        $i = 0;
        foreach($album_select->getTable()->fetchAll($album_select) as $album )  {
          if (Engine_Api::_()->authorization()->isAllowed($album, $viewer, 'view')){
            $new_select[$i++] = $album;
          }
        }

        $this->view->albums = $albums = Zend_Paginator::factory($new_select);

        // Set item count per page and current page number
        $albums->setItemCountPerPage($this->_getParam('itemCountPerPage', $limit));
        $albums->setCurrentPageNumber($this->_getParam('page', 1));

        // Do not render if nothing to show
        if( $albums->getTotalItemCount() <= 0 ) {
          return $this->setNoRender();
        }
    } elseif($carousel_opt == 2) {
//=============================
//      CLASSIFIEDS
//=============================
    // Get paginator
        $classf_table = Engine_Api::_()->getItemTable('classified');
        $classf_select = $classf_table->select()
            ->where('search = ?', 1)
            ->where('photo_id != ?', 0);
        if( $recentType == 'creation' ) {
          // using primary should be much faster, so use that for creation
          $classf_select->order('classified_id DESC');
        } else {
          $classf_select->order($recentCol . ' DESC');
        }
        $this->view->classifieds = $classifieds = Zend_Paginator::factory($classf_select);

        // Set item count per page and current page number
        $classifieds->setItemCountPerPage($this->_getParam('itemCountPerPage', $limit));
        $classifieds->setCurrentPageNumber($this->_getParam('page', 1));

        // Hide if nothing to show
        if( $classifieds->getTotalItemCount() <= 0 ) {
          return $this->setNoRender();
        }
    } elseif($carousel_opt == 3) {
//==================================
//    EVENTS
//==================================
    // Get paginator
        $events_table = Engine_Api::_()->getItemTable('event');
        $events_select = $events_table->select()
            ->where('search = ?', 1)
            ->where('photo_id != ?', 0);
        if( $recentType == 'creation' ) {
          // using primary should be much faster, so use that for creation
          $events_select->order('event_id DESC');
        } else {
          $events_select->order($recentCol . ' DESC');
        }
        // If start or end, filter by < now
        if( $recentType == 'start' ) {
          $events_select->where('starttime < ?', new Zend_Db_Expr('NOW()'));
        } else if( $recentType == 'end' ) {
          $events_select->where('endtime < ?', new Zend_Db_Expr('NOW()'));
        }
        $this->view->events = $events = Zend_Paginator::factory($events_select);

        // Set item count per page and current page number
        $events->setItemCountPerPage($this->_getParam('itemCountPerPage', $limit));
        $events->setCurrentPageNumber($this->_getParam('page', 1));

        // Hide if nothing to show
        if( $events->getTotalItemCount() <= 0 ) {
          return $this->setNoRender();
        }
    } elseif($carousel_opt == 4) {
//=============================
//      GROUPS
//=============================
    // Get paginator
        $groups_table = Engine_Api::_()->getItemTable('group');
        $groups_select = $groups_table->select()
                ->where('photo_id != ?', 0);
         // ->where('search = ?', 1);
        if( $recentType == 'creation' ) {
          // using primary should be much faster, so use that for creation
          $groups_select->order('group_id DESC');
        } else {
          $groups_select->order($recentCol . ' DESC');
        }
        $this->view->groups = $groups = Zend_Paginator::factory($groups_select);

        // Set item count per page and current page number
        $groups->setItemCountPerPage($this->_getParam('itemCountPerPage', $limit));
        $groups->setCurrentPageNumber($this->_getParam('page', 1));

        // Hide if nothing to show
        if( $groups->getTotalItemCount() <= 0 ) {
          return $this->setNoRender();
        }
    }   elseif($carousel_opt == 5) {
//=============================
//      PHOTOS
//=============================
        $parentTable = Engine_Api::_()->getItemTable('album');
        $parentTableName = $parentTable->info('name');
        $ph_table = Engine_Api::_()->getItemTable('album_photo');
        $ph_tableName = $ph_table->info('name');
        $ph_select = $ph_table->select()
          ->from($ph_tableName)
          ->joinLeft($parentTableName, $parentTableName . '.album_id=' . $ph_tableName . '.album_id', null)
          ->where($parentTableName . '.search = ?', true);
        if( $photo_opt == 1 ) {
            $ph_select->order('photo_id DESC');
        } elseif ( $photo_opt == 2 ) {
            $ph_select->order('comment_count DESC');
        } elseif ( $photo_opt == 3 ) {
            $ph_select->order('view_count DESC');
        }

        // Create new array filtering out private photos
        $photo_select = $ph_select;
        $ph_new_select = array();
        $ph_i = 0;
        foreach($photo_select->getTable()->fetchAll($photo_select) as $photo )  {
          if (Engine_Api::_()->authorization()->isAllowed($photo, $viewer, 'view')){
            $ph_new_select[$ph_i++] = $photo;
          }
        }

        $this->view->photos = $photos = Zend_Paginator::factory($ph_new_select);

        // Set item count per page and current page number
        $photos->setItemCountPerPage($this->_getParam('itemCountPerPage', $limit));
        $photos->setCurrentPageNumber($this->_getParam('page', 1));

        // Do not render if nothing to show
        if( $photos->getTotalItemCount() <= 0 ) {
          return $this->setNoRender();
        }
    } 
  }
}