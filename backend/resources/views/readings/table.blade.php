<div class="table-responsive">
    <table class="table" id="readings-table">
        <thead>
            <tr>
                <th>Hole Id</th>
        <th>Depth</th>
        <th>Dip</th>
        <th>Azimuth</th>
        <th>Is Trustworthy</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($readings as $reading)
            <tr>
                <td>{{ $reading->hole_id }}</td>
            <td>{{ $reading->depth }}</td>
            <td>{{ $reading->dip }}</td>
            <td>{{ $reading->azimuth }}</td>
            <td>{{ $reading->is_trustworthy }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['readings.destroy', $reading->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('readings.show', [$reading->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('readings.edit', [$reading->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>
                        {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
