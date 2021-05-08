<!-- Latitude Field -->
<div class="col-sm-12">
    {!! Form::label('latitude', 'Latitude:') !!}
    <p>{{ $hole->latitude }}</p>
</div>

<!-- Longitude Field -->
<div class="col-sm-12">
    {!! Form::label('longitude', 'Longitude:') !!}
    <p>{{ $hole->longitude }}</p>
</div>

<!-- Dip Field -->
<div class="col-sm-12">
    {!! Form::label('dip', 'Dip:') !!}
    <p>{{ $hole->dip }}</p>
</div>

<!-- Azimuth Field -->
<div class="col-sm-12">
    {!! Form::label('azimuth', 'Azimuth:') !!}
    <p>{{ $hole->azimuth }}</p>
</div>

<!-- Created At Field -->
<div class="col-sm-12">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{{ $hole->created_at }}</p>
</div>

<!-- Updated At Field -->
<div class="col-sm-12">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{{ $hole->updated_at }}</p>
</div>

