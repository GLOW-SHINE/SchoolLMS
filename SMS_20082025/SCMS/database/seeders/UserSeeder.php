<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Admin
        User::factory()->count(3)->admin()->create();

        // Teacher
        User::factory()->count(10)->teacher()->create(); // creates 10 users with default role 'student'
        
        // Parent
        User::factory()->count(57)->parent()->create();

        // Student
        User::factory()->count(30)->student()->create();
    }
}
