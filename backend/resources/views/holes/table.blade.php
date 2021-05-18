<div class="table-responsive">
    <table class="table" id="holes-table">
        <thead>
            <tr>
                <th>Latitude</th>
        <th>Longitude</th>
        <th>Dip</th>
        <th>Azimuth</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($holes as $hole)
            <tr>
                <td>{{ $hole->latitude }}</td>
            <td>{{ $hole->longitude }}</td>
            <td>{{ $hole->dip }}</td>
            <td>{{ $hole->azimuth }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['holes.destroy', $hole->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('holes.show', [$hole->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('holes.edit', [$hole->id]) }}" class='btn btn-default btn-xs'>
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
