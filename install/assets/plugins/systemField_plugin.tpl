//<?php
/**
 * systemField
 * 
 * The plugin allows you to add "system" data in a separate field, which will be displayed along with the page content.
 *
 * @category    plugin
 * @version     1.3
 * @author		Andhir
 * @internal    @properties &separator=Separator;string;<!-- hr --> &open_text=Open link text;string;system content &position=System content position;list;before,after;after
 * @internal    @events OnDocFormRender
 * @internal    @installset base
 * @internal    @disabled 1
 */
/*
systemField 1.3 plugin for MODx Evo
The plugin allows you to add "system" data in a separate field, which will be displayed along with the page content.
by Andhir
Сделано для студии "Симпл дрим" - http://www.simpledream.ru/
-----------------------------------------
System event: OnDocFormRender
Configurtion:
&separator=Separator;string;<!-- hr --> &open_text=Open link text;string;system content &position=System content position;list;before,after;after
*/

defined('IN_MANAGER_MODE') or die();
if ($modx->event->name !== 'OnDocFormRender') return;

if(empty($separator)) $separator = '<!-- hr -->';
if(empty($open_text)) $open_text = 'system content';
if(empty($position))  $position  = 'after';

$ph['separator']  = $separator;
$ph['open_text']  = $open_text;
$ph['position']   = $position;
$ph['get_action'] = isset($_GET['a']) ? $_GET['a'] : 27;;
$output = file_get_contents(MODX_BASE_PATH . 'assets/plugins/systemField/systemField.js.inc');

foreach($ph as $k=>$v)
{
	$k = "[+{$k}+]";
	$output = str_replace($k,$v,$output);
}

$modx->event->output($output);
