<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ClassifiedController extends Controller
{
    // Attributes
    private $id;
    private $title;
    private $content;
    private $date;
    private $category;
    private $image;
    private $visible;
    private $name;
    private $email;
    private $phone;
    private $price;

    // Constructor
    public function __construct($id, $title, $content, $date, $category, $image, $visible, $name, $email, $phone, $price)
    {
        $this->id         = $id;
        $this->title      = $title;
        $this->content    = $content;
        $this->date       = $date;
        $this->category   = $category;
        $this->image      = $image;
        $this->visible = $visible;
        $this->name       = $name;
        $this->email      = $email;
        $this->phone      = $phone;
        $this->price      = $price;
    }

    // Methods
    private function createClassified( $data = [] )
    {
        // Create a new classified
    }

    private function updateClassified( $id = 0, $data = [] )
    {
        // Update a classified
    }

    private function deleteClassified( $id = 0 )
    {
        // Delete a classified
    }

    private function getClassified( $id = 0 )
    {
        // Get a classified
    }

    private function getClassifieds( $category = 'all' )
    {
        // Get all classifieds or by category
    }
}
