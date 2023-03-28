<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{

    use HasFactory, SoftDeletes;

    protected $fillable = [
        'picturePath', 'name', 'description', 'price', 'stock',
    ];
    protected $hidden = [
        'deleted_at',
    ];
}
