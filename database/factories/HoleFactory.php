<?php

namespace Database\Factories;

use App\Models\Hole;
use Illuminate\Database\Eloquent\Factories\Factory;

class HoleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Hole::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'latitude' => $this->faker->randomFloat(NULL, 10, 99),
            'longitude' => $this->faker->randomFloat(NULL, 20, 99),
            'dip' => $this->faker->randomFloat(NULL, 10, 99),
            'azimuth' => rand(0,359),
        ];
    }
}
