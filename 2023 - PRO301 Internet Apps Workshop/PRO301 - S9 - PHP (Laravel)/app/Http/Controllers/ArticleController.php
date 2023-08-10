<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ArticleController extends Controller
{
    // Attributes
    private $id;
    private $title;
    private $content;
    private $excerpt;
    private $author;
    private $date;
    private $category;
    private $source;
    private $featuredImage;
    private $visibile;

    // Constructor
    public function __construct($id, $title, $content, $excerpt, $author, $date, $category, $source, $featuredImage, $visibile)
    {
        $this->id            = $id;
        $this->title         = $title;
        $this->content       = $content;
        $this->excerpt       = $excerpt;
        $this->author        = $author;
        $this->date          = $date;
        $this->category      = $category;
        $this->source        = $source;
        $this->featuredImage = $featuredImage;
        $this->visibile      = $visibile;
    }

    // Methods
    private function createArticle( $data = [] )
    {
        // Create a new article
    }

    private function updateArticle( $id = 0, $data = [] )
    {
        // Update an existing article
    }

    private function deleteArticle( $id = 0 )
    {
        // Delete an existing article
    }

    private function getArticle( $id = 0 )
    {
        // Get an existing article
    }

    private function getArticles( $category = 'all' )
    {
        // Get all existing articles (by category or all)
    }
}
