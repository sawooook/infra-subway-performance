package nextstep.subway.map.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import nextstep.subway.station.dto.StationResponse;

import java.util.List;

public class PathResponse {
    @JsonIgnore
    private List<StationResponse> stations;
    @JsonIgnore
    private int distance;

    public PathResponse() {
    }

    public PathResponse(List<StationResponse> stations, int distance) {
        this.stations = stations;
        this.distance = distance;
    }

    public List<StationResponse> getStations() {
        return stations;
    }

    public int getDistance() {
        return distance;
    }
}
