<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::all();
        return response()->json([
            'success' => true,
            'data' => $products
        ], Response::HTTP_OK);
    }
}
