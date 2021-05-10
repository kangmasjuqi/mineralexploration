@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <p style="float:right;">
                        <a href="{{ route('logout') }}"
                           onclick="event.preventDefault();
                                         document.getElementById('logout-form-on-body').submit();">
                            <button class="btn btn-danger">{{ __('Logout') }}</button>
                        </a>

                        <form id="logout-form-on-body" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </p>
                    <p>
                        {{ __('You are logged in!') }}
                    </p>

                    <h5>Hole & Readings Table</h5>
                    <table class="table table-border">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Lat & Long</th>
                                <th>Dip</th>
                                <th>Azimuth</th>
                                <th>Readings</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                            $ii = 1;
                            if(count($all_holes)>0)
                                foreach($all_holes as $hole){
                                    echo '
                                        <tr>
                                            <td>'.$ii++.'.</td>
                                            <td>'.$hole->latitude.', '.$hole->longitude.'</td>
                                            <td>'.$hole->dip.'</td>
                                            <td>'.$hole->azimuth.'</td>
                                            <td>
                                                <a href="#">View '.count($hole->readings).' Readings</a>
                                            </td>
                                        </tr>
                                    ';
                                }
                        ?>
                        </tbody>
                    </table>

					<div id="example"></div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
