<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReadingsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('readings', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('hole_id')->unsigned();
            $table->float('depth');
            $table->float('dip');
            $table->float('azimuth');
            $table->integer('is_trustworthy');
            $table->timestamps();
            $table->foreign('hole_id')->references('id')->on('holes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('readings');
    }
}
