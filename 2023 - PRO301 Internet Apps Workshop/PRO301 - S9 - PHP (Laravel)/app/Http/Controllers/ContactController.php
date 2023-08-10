<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use Illuminate\Http\Request;
use App\Models\Contact;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function index(Request $request)
    {
        return view('contact');
    }

    // Receive the form submission
    public function store(Request $request) {
        // Validate the form
        $request->validate([
            'name'    => 'required',
            'subject' => 'required',
            'email'   => 'required|email',
            'message' => 'required',
            '_token'  => 'required',
            ]);

        // Check if csrf token matches
        if ($request->input('_token') !== csrf_token()) {
            return redirect('/contact')
                ->with('error', 'Token inválido.');
        }

        // Store the contact form data
        Contact::create($request->all());

        // Send email copy to the user
        Mail::to($request->email)->send(new ContactMail($request));

        // Redirect to the contact page
        return redirect('/contact')
            ->with('success', 'Mensaje Recibido. Gracias por contactarnos.');
    }
}
