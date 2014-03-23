<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_wsmusic
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
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
				'index.php?option=com_wsmusic&view=categories',
				$vName == 'categories'
		);
		JHtmlSidebar::addEntry(
				JText::_('COM_WSMUSIC_SUBMENU_ARTIST'),
				'index.php?option=com_wsmusic&view=artist',
				$vName == 'artist'
		);
		JHtmlSidebar::addEntry(
				JText::_('COM_WSMUSIC_SUBMENU_PLAYLIST'),
				'index.php?option=com_wsmusic&view=playlist',
				$vName == 'playlist'
		);
	}
}
