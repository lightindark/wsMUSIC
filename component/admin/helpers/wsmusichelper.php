<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_wsmusic
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Wsmusic component helper.
 *
 * @package     Joomla.Administrator
 * @subpackage  com_wsmusic
 * @since       0.0.1
 */
class WsmusicHelper extends JHelperContent
{
	/**
	 * Configure the Linkbar.
	 *
	 * @param   string  $vName  The name of the active view.
	 *
	 * @return  void
	 *
	 * @since   0.0.1
	 */
	public static function addSubmenu($vName = 'tracks')
	{
		JHtmlSidebar::addEntry(
				JText::_('COM_WSMUSIC_SUBMENU_TRACKS'),
				'index.php?option=com_wsmusic&view=tracks',
				$vName == 'tracks'
		);
		JHtmlSidebar::addEntry(
				JText::_('COM_WSMUSICS_SUBMENU_CATEGORIES'),
				'index.php?option=com_categories&extension=com_wsmusic',
				$vName == 'categories'
		);
	}
}
