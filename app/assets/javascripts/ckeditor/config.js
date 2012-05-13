/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	config.uiColor = '#DDD';
	
	config.contentsCss = ['/assets/bootstrap.css', '/assets/core.css'];
	config.enterMode = CKEDITOR.ENTER_BR;
	config.fillEmptyBlocks = false;
	config.autoParagraph = false;
	config.ignoreEmptyParagraph = true;
	config.toolbar = 'Full';

	config.toolbar_Full =
	[
		{ name: 'document', items : [ 'Source','-','Save' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker'] },
		{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		'/',
		{ name: 'basicstyles', items : [ 'Subscript','Superscript','-','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		'/',
		{ name: 'styles', items : ['Format'] },
		{ name: 'insert', items : [ 'Image','Table','HorizontalRule','SpecialChar','PageBreak' ] },
		{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
	];
};


