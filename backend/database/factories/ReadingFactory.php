<?php

namespace Database\Factories;

use App\Models\Reading;
use Illuminate\Database\Eloquent\Factories\Factory;

class ReadingFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Reading::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'hole_id' => rand(1,3),
            'depth' => $this->faker->randomFloat(NULL, 10, 1000),
            'dip' => $this->faker->randomFloat(NULL, 10, 99),
            'azimuth' => rand(0,359),
            'is_trustworthy' => 1,
        ];
    }
}
