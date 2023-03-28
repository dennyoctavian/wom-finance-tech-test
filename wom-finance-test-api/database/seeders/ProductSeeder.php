<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Faker\Factory as Faker;



class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create('id_ID');
        for ($i=0; $i < 20; $i++) { 
            DB::table('products')->insert([
                'picturePath' => 'https://placeimg.com/400/400/any?' . rand(1, 100),
                'name' => $faker->name,
                'description' => $faker->text,
                'price'=> rand(500000, 1000000),
                'stock'=> rand(0, 100),
                'created_at'=> Carbon::now(),
                'updated_at'=> Carbon::now(),

            ]);
        }
        
    }
}
