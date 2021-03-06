<?php
/**
 * TYPOlight Helpdesk :: Index page template
 *
 * NOTE: this file was edited with tabs set to 4.
 * @package Helpdesk
 * @copyright Copyright (C) 2007, 2008 by Peter Koch, IBK Software AG
 * @license See accompaning file LICENSE.txt
 */
?>
<!-- 

	TYPOlight Forum/Helpdesk :: Copyright (C) 2007, 2008 by Peter Koch, IBK Software AG
	Visit http://www.typolight.org/extension-list/view/helpdesk.html for details.
	
-->
<!-- indexer::stop -->
<?php $hd = &$this->helpdesk; $text = &$hd->text; ?>
<div class="<?php echo $this->class; ?> block"<?php echo $this->cssID; ?><?php if ($this->style) { ?> style="<?php echo $this->style; ?>"<?php } ?>>

<?php if ($this->headline) { ?>
<<?php echo $this->hl; ?>><?php echo $this->headline; ?></<?php echo $this->hl; ?>>
<?php } // if this->headline ?>

<?php if ($this->headertext) { ?>
<div class="headertext"><?php echo $this->headertext; ?></div>
<?php } // if this->headertext ?>

<?php if (count($hd->categories)) { ?>

<?php if ($this->links) { ?>
<div class="topcontrols controls middle">
<span class="functions">
<?php if ($hd->nopasteLink) { ?>
<?php echo $hd->createImage('nopaste16'); ?><a href="<?php echo $hd->nopasteLink; ?>"><?php echo $text['nopaste']; ?></a>
<?php } else { ?>
<?php if ($hd->feedLink) { ?>
<?php echo $hd->createImage('feed14'); ?><a href="<?php echo $hd->feedLink; ?>"><?php echo $text['feed']; ?></a>
<?php } ?>
<?php if ($hd->searchLink) { ?>
<?php echo $hd->createImage('find16'); ?><a href="<?php echo $hd->searchLink; ?>"><?php echo $text['search']; ?></a>
<?php } ?>
<?php if ($hd->mineLink) { ?>
<?php echo $hd->createImage('mine16'); ?><a href="<?php echo $hd->mineLink; ?>"><?php echo $text['mine']; ?></a>
<?php } ?>
<?php if ($hd->recentLink) { ?>
<?php echo $hd->createImage('recent16'); ?><a href="<?php echo $hd->recentLink; ?>"><?php echo $text['recent']; ?></a>
<?php } ?>
<?php if ($hd->unansweredLink) { ?>
<?php echo $hd->createImage('lemon16'); ?><a href="<?php echo $hd->unansweredLink; ?>"><?php echo $text['unanswered']; ?></a>
<?php } ?>
<?php if ($hd->unreadLink) { ?>
<?php echo $hd->createImage('unread16'); ?><a href="<?php echo $hd->unreadLink; ?>"><?php echo $text['unread']; ?></a>
<?php } ?>
<?php if ($hd->markReadLink) { ?>
<?php echo $hd->createImage('checked16'); ?><a href="<?php echo $hd->markReadLink; ?>"><?php echo $text['markallread']; ?></a>
<?php } ?>
<?php } // !nopasteLink ?>
</span>
</div>
<?php } // if this->links ?>

<table class="mainlist">
<tr>
<th class="iconcol">&nbsp;</th>
<th class="category maxwidth"><?php echo $text['category']; ?></th>
<th class="ticketcount centered"><?php echo $text['tickets']; ?></th>
<th class="replycount centered"><?php echo $text['replies']; ?></th>
<th class="latestpost"><?php echo $text['latestpost']; ?></th>
<?php if (strlen($hd->username)) { ?>
<th class="icons">&nbsp;</th>
<?php } // if strlen ?>
</tr>
<?php foreach ($hd->categories as $cat) { ?>
<?php if ($cat->header) { ?>
<tr class="headerrow">
<td class="headercol" colspan="<?php echo ($cat->markReadLink || $cat->pasteLink) ? 6 : 5; ?>"><?php echo $cat->header; ?></td>
</tr>
<?php } ?>
<tr class="datarow<?php if (!$cat->read) echo ' datarow-unread'; ?>">
<td class="iconcol">
<div class="icon"><?php echo $hd->createImage('category'.$cat->access.'16'); ?></div>
</td>
<td class="category">
<div class="title">
<a href="<?php echo $cat->listTicketsLink; ?>" class="unreadbold"><?php echo $cat->title; ?></a>
</div>
<div class="description"><?php echo $cat->description; ?></div>
</td>
<td class="ticketcount centered"><?php echo $cat->ticketcount; ?></td>
<td class="replycount centered"><?php echo $cat->replycount; ?></td>
<td class="latestpost"><a href="<?php echo $cat->latestlink; ?>" class="tstamp nowrap"><?php echo $cat->latesttstamp; ?><br />
<?php echo $cat->latestposter; ?></a></td>
<?php if ($cat->markReadLink || $cat->pasteLink) { ?>
<td class="icons middle">
<?php if ($cat->pasteLink) { ?>
<a href="<?php echo $cat->pasteLink; ?>" title="<?php echo $text['paste']; ?>"><?php echo $hd->createImage('paste16',$text['paste'],'title="'.$text['paste'].'"'); ?></a>
<?php } else { ?>
<?php if ($cat->markReadLink) { ?>
<a href="<?php echo $cat->markReadLink; ?>" title="<?php echo $text['markcatread']; ?>"><?php echo $hd->createImage('checked16',$text['markcatread'],'title="'.$text['markcatread'].'"'); ?></a>
<?php } ?>
<?php } ?>
</td>
<?php } // if cat->markReadLink ?>
</tr>
<?php } // foreach hd->categories ?>
</table>
<?php } else { ?>
<div class="helpdesk-nocategories">
<?php echo $text['nocategories']; ?>
</div>
<?php } // if count dh->categories ?>

</div>
<!-- indexer::continue -->
