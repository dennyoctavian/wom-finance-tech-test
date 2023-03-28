<?php

namespace App\Http\Controllers;

use App\Models\ListTransactionProduct;
use App\Models\Product;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Validator;

class TransactionController extends Controller
{
    public function index(Request $request)
    {
        $user = JWTAuth::user();
        $transactions = Transaction::where('user_id', $user->id)->get();
        foreach ($transactions as $transaction) {
            $transaction->products = ListTransactionProduct::where('transaction_id', $transaction->id)->get();
            foreach ( $transaction->products as $productIterate) {
                $productIterate->product = Product::where('id',$productIterate->product_id)->first();
            }
        }
        
        return response()->json([
            'success' => true,
            'data' => $transactions
        ], Response::HTTP_OK);
    }

    public function create(Request $request)
    {

        $validator = Validator::make($request->all(), 
                      [ 
                      'products' => 'required|array',
                      'products.*.product_id' => 'required|integer',
                      'products.*.quantity' => 'required|integer',
                     ]);  
        if ($validator->fails()) {  
            return response()->json(['error'=>$validator->errors()], 401); 
        }   
        $user = JWTAuth::user();
        $price = 0;

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->total_price = $price;
        $transaction->save();

        foreach ($request->products as $product) {
            $listItem = new ListTransactionProduct();
            $listItem->product_id = $product['product_id'];
            $listItem->quantity = $product['quantity'];
            $listItem->transaction_id = $transaction->id;
            $productSales = Product::where('id', $product['product_id'])->first();;
            $total_price_item = ($productSales->price)*$product['quantity'];
            $productSales->stock = $productSales->stock - $product['quantity'];
            $productSales->update();
            $listItem->total_price_item =  $total_price_item;
            $price +=  $total_price_item;
            $listItem->save();
        }

        $transaction->total_price = $price;
        $transaction->update();
        $transaction->products = ListTransactionProduct::where('transaction_id', $transaction->id)->get();
    
        return response()->json([
            'success' => true,
            'data' => $transaction,
        ], Response::HTTP_OK);
    }
}
