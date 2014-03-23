<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Form
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

JFormHelper::loadFieldClass('list');

/**
 * Form Field class for the Joomla Platform.
 * Provides a select list of integers with specified first, last and step values.
 *
 * @package     Joomla.Platform
 * @subpackage  Form
 * @since       11.1
 */
class JFormFieldNewInteger extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var    string
	 * @since  11.1
	 */
	protected $type = 'NewInteger';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  The field option objects.
	 *
	 * @since   11.1
	 */
	protected function getOptions()
	{
		$options = array();

		// Initialize some field attributes.
		$first = (int) $this->element['first'];
		$last = (int) $this->element['last'];
		$step = (int) $this->element['step'];
		$newStep = (int) $this->element['newstep'];
		$defaultOptKey=$this->element['defaultoptkey'];
		$options[] = JHtml::_('select.option', '',$defaultOptKey);
		// Sanity checks.
		if ($step == 0)
		{
			// Step of 0 will create an endless loop.
			return $options;
		}
		elseif ($first < $last && $step < 0)
		{
			// A negative step will never reach the last number.
			return $options;
		}
		elseif ($first > $last && $step > 0)
		{
			// A position step will never reach the last number.
			return $options;
		}
		elseif ($step < 0)
		{
			// Build the options array backwards.
			for ($i = $first; $i >= $last; $i += $step)
			{
				$options[] = JHtml::_('select.option', $i,$defaultOptKey.' > '.$i);
			}
		}
		else
		{
			for( $i = $first; $i <= $last/10; $i*=10)
			{
				for($j = $i; $j <= $i * 10; $j += $i)
				{
					if($j==$last)
					{
						$options[] = JHtml::_('select.option', $j,$defaultOptKey.' >= '.number_format($j,0,',',' '));
					}
					else if( ($j < $i * 10 ) && ( $j / $i % $newStep == 0 || $j == $i ) )
					{
						$options[] = JHtml::_('select.option', $j,$defaultOptKey.' >= '.number_format($j,0,',',' '));
					}
				}
			}
		}

		// Merge any additional options in the XML definition.
		$options = array_merge(parent::getOptions(), $options);

		return $options;
	}
}
