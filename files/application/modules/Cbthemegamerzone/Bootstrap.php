<?php

class Cbthemegamerzone_Bootstrap extends Engine_Application_Bootstrap_Abstract
{
    public function __construct($application) {
        parent::__construct($application);
            $doctypeHelper = new Zend_View_Helper_Doctype();
            $doctypes = $doctypeHelper->getDoctypes();
            if (isset($doctypes['XHTML1_RDFA']))
                $doctypeHelper->doctype('XHTML1_RDFA'); 
    }
}