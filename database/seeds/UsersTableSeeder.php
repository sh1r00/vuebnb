<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use App\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'user_id'        => '1',
            'name'           => 'Jane Smith',
            'email'          => 'test@gmail.com',
            'password'       => Hash::make('test'),
            'remember_token' => Str::random(60),
            'friends'        => [],
            'chats'          => [],
            'created'        => [],
            'ratings'        => [],
            'comments'       => [],
            'saved'          => [1,5,7,9]
        ]);
        User::create([
            'user_id'        => '2',
            'name'           => 'John Doe',
            'email'          => 'test2@gmail.com',
            'password'       => Hash::make('test'),
            'remember_token' => Str::random(60),
            'friends'        => [],
            'chats'          => [],
            'created'        => [],
            'ratings'        => [],
            'comments'       => [],
            'saved'          => [2,11,22]
        ]);
    }
}
