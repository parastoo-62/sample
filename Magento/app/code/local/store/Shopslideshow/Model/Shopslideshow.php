<?php
/**
 * @version   0.1.0
 * @author    http://devjuhong.com <zzeppon@hotmail.com>
 */

class store_shopslideshow_Model_shopslideshow extends Mage_Core_Model_Abstract
{
    public function _construct()
    {
        parent::_construct();
        $this->_init('shopslideshow/shopslideshow');
    }

}