<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ItemsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('items')->insert([
            [
                'name' => Str::random(10),
                'stock' => rand(1,1000),
                'favorite' => rand(1,0),
                'category' => Str::random(50),
                'description' => Str::random(150)
            ]
        );
    }
}
