import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// [...]

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  console.log("initiated Mapbox")
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
     });

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      console.log(marker)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });

    const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 100, maxZoom: 12, duration: 100 });
    };

    if (mapElement) {
    fitMapToMarkers(map, markers);
    }

    if (mapElement) {
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,mapboxgl: mapboxgl }));
    }
  };
};

export { initMapbox };
