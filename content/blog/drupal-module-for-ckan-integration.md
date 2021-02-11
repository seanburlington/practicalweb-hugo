---
layout: post
title: Drupal Module for CKAN Integration
date: 2010-02-24T22:55:47Z
comments: true
tags:
  - drupal
  - ckan
---

Here's a basic Drupal Module that pulls CKAN data into Drupal.

It provides a simple search interface - when the user views a CKAN package for the first time a corresponding node is created.

When this node is then viewed Drupal loads the package details - I'm only displaying notes and title here as I've run out of time tonight - but the rest of the data is there.

You can then have user comments, voting, etc on these pages.

This is fairly quickly put together code and it's incomplete - but it should be enough to get people started - if there's interest I'll carry on with this so please add comments.

I've created a github repository for it and I'll start using the issue tracker there.

http://github.com/practicalweb/drupal-ckan

```php
<?php

/**
 * @file
 * A Module to Integrate CKAN and Drupal.
 *
 * This works by
 *
 *   1. providing a serach and listing interface to CKAN with links to this Drupal site
 *   2. using a wildcard menu handler to match these links in the first instance
 *   3. this loads the packages and creates matching nodes (storing the ckan name)
 *   4. the node has a url alias which overrides the wildcard match
 *
 *   Now we have Drupal nodes which can have user commments associated with them, fivestar votes etc...
 *
 * @author Sean Burlington www.practicalweb.co.uk
 * @copyright PracticalWeb Ltd
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License
 *
 */

function ckan_menu(){
    $items = array();

    // link to the search form page
    $items['ckan_search'] = array(
    'title'           => t('Search CKAN'),
    'page callback'   => 'drupal_get_form',
    'page arguments'  => array('ckan_search_form'),
    'access callback' => TRUE,
    );

    $items['ckan/search/%'] = array(
    'page callback'     => 'ckan_search_results_page',
    'page arguments'    => array(2),
    'access arguments'  => array('access content'),
    'type'              => MENU_CALLBACK,
    );

    $items['ckan/data/%'] = array(
    'page callback'   => 'ckan_new',
    'page arguments'  => array(2),
    'access arguments' => array('access content'),
    'type'            => MENU_CALLBACK,
    );


    return $items;
}


/**
 * Gets the ckan Object
 * Initialises it in one central place reusing it if needed.
 *
 * @return Ckan $ckan
 */
function ckan_ckan(){
	static $ckan=null;
	if (!$ckan){
		require_once(dirname(__FILE__) . '/ckan.php');
		$ckan=new Ckan(variable_get('ckan_site', 'http://www.ckan.net/'));
	}
	return $ckan;
}

/**
 * Implements hook_form
 *
 * @param Array $form_state
 * @return Array $form
 */
function ckan_search_form(&$form_state){

	$form = array();
	$form['q'] = array(
                   '#type'          => 'textfield',
                   '#default_value' => '',
	);
	$form['submit'] = array(
                   '#type'          => 'submit',
                   '#value'         => t('Search CKAN'),
	);

	return $form;
}


function ckan_search_form_submit($form, &$form_state) {
	  // The search form relies on control of the redirect destination for its
  // functionality, so we override any static destination set in the request,
  // for example by drupal_access_denied() or drupal_not_found()
  // (see http://drupal.org/node/292565).
  if (isset($_REQUEST['destination'])) {
    unset($_REQUEST['destination']);
  }
  if (isset($_REQUEST['edit']['destination'])) {
    unset($_REQUEST['edit']['destination']);
  }

  $form_state['redirect'] = 'ckan/search/'. trim($form_state['values']['q']);

}

function ckan_search_results_page($search){
//	return $search;
    try {
     $ckan = ckan_ckan();

     $results = $ckan->search(check_plain($search));
    } catch (Exception $e){
        return $e->getMessage();
    }
    return theme('ckan_search_results', $results);
}

/**
 * Create the node the first time this package is seen.
 *
 * This creates a specific URL which override the wildcard one subsequently
 *
 * @param String $ckan_name
 */
function ckan_new($ckan_name){

    $ckan = ckan_ckan();
    try {
        $ckan_data = $ckan->getPackage($ckan_name);
    } catch (CkanException $e){
        drupal_set_message($e->getMessage(), 'error');
        drupal_set_title("Error");
        return "Error" ;
    }
    $node = ckan_create_node($ckan_data);
    drupal_goto('node/'. $node->nid);
}



function ckan_create_node($ckan_data){
    $node = array(
              'title'   => $ckan_data->title,
              'uid'     => 1,
              'body'    => $ckan_data->name,
              'promote' => 1,
              'path'    => 'ckan/data/' . $ckan_data->name,
              'type'    => 'ckan',
              'comment' => 2,

    );

    if ($node = node_submit($node)) {
        node_save($node);
    } else {
        drupal_set_message("Failed to create node for package.");
    }
    return $node;
}


function ckan_node_info() {

    return array(
    'ckan' => array(
      'name'           => t('CKAN Package'),
      'module'         => 'ckan',
      'description'    => t('A package of Open Data.'),
      'has_title'      => TRUE,
      'title_label'    => t('Title'),
      'has_body'       => TRUE,
      'body_label'     => t('Package Description'),
      'min_word_count' => 0,
      'locked'         => TRUE
    )
    );
}

function ckan_load($node){
	$ckan = ckan_ckan();
	try {
		$node->ckan = $ckan->getPackage($node->body);
	} catch(Exception $e){
		drupal_set_message($e->getMessage(), 'error');
	}
//	print_r($node->ckan);
	return $node;
}

function ckan_view($node, $teaser = FALSE, $page = FALSE) {


  $node = node_prepare($node, $teaser);
  $node->content['title']['#value']  = check_plain($node->ckan->title);
  $node->content['body']['#value'] = nl2br(check_plain($node->ckan->notes));

  return $node;
}






function ckan_theme() {
    return array(
    'ckan_search_results' => array('arguments' => array('results')),
    );
}




function theme_ckan_search_results($results) {
    $content = '';
    $content .= "<p>" . $results->count . " Results found</p>";
    foreach ($results->results as $package){
    	$content .= '<h2>' . l($package->title, 'ckan/data/' . urlencode(check_plain($package->name))) . '</h2>';
    	$content .= '<p>' . nl2br(check_plain($package->notes)) . '</p>';
    	$content .= '<p>';
    	foreach ($package->groups as $i => $group){
    		$content .= '<b>' . check_plain($group) . '</b> ';
    	}
    	$content .= '</p>';
    }
    return $content;

}
?>

```

see also [Accessing CKAN data from PHP](/blog/10/02/23/accessing-ckan-data-php)
