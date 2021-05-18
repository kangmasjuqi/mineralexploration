<!-- Hole Id Field -->
<div class="col-sm-12">
    {!! Form::label('hole_id', 'Hole Id:') !!}
    <p>{{ $reading->hole_id }}</p>
</div>

<!-- Depth Field -->
<div class="col-sm-12">
    {!! Form::label('depth', 'Depth:') !!}
    <p>{{ $reading->depth }}</p>
</div>

<!-- Dip Field -->
<div class="col-sm-12">
    {!! Form::label('dip', 'Dip:') !!}
    <p>{{ $reading->dip }}</p>
</div>

<!-- Azimuth Field -->
<div class="col-sm-12">
    {!! Form::label('azimuth', 'Azimuth:') !!}
    <p>{{ $reading->azimuth }}</p>
</div>

<!-- Is Trustworthy Field -->
<div class="col-sm-12">
    {!! Form::label('is_trustworthy', 'Is Trustworthy:') !!}
    <p>{{ $reading->is_trustworthy }}</p>
</div>

<!-- Created At Field -->
<div class="col-sm-12">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{{ $reading->created_at }}</p>
</div>

<!-- Updated At Field -->
<div class="col-sm-12">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{{ $reading->updated_at }}</p>
</div>

