<resource schema="gmap" resdir=".">
  <meta name="title">GMAP</meta>
  <meta name="description">
    GMap provides planetary geological maps of different Solar System bodies,
    developed by an open community, reviewed by scientists. GMap inherits data
    model from Planmap, most of the maps provide
    morphological information, some maps provide stratigraphic or compositional
    information too. Each original data packages provided is a collection
    of vector, raster, and, in some cases, 3D models.
    In this EPN/TAP service, the data records (`granule_uid`) refer to each of the
    data files in the whole of GMAP archive, grouped by (`granule_gid`) the
    data package --map-- they compose.
  </meta>
  <meta name="creationDate">2023-09-01T01:01:01</meta>
  <meta name="subject">planetary-geology</meta>
  <meta name="creator.name">Carlos Henrique Brandt</meta>
  <meta name="subjects">geology, maps, planet</meta>
  <meta name="instrument">custom</meta>
  <meta name="facility">custom</meta>
  <meta name="contentLevel"></meta>
  <meta name="type">Catalog</meta>
  <meta name="coverage">
    <meta name="Profile">Solar System</meta>
  </meta>


  <table id="epn_core" onDisk="true" adql="True" primary="granule_uid">
    <mixin spatial_frame_type="body"
        optional_columns="access_format access_estsize access_md5 publisher bib_reference file_name"
        >
           //epntap2#table-2_0
    </mixin>
    <stc> Polygon UNKNOWNFrame [s_region] </stc>
    <publish sets="ivo_managed,local"/>
  </table>

  <data id="import">
    <sources>data/data.csv</sources>
    <csvGrammar>
      <rowfilter procDef="//products#define">
        <bind name="table">"schema.epn_core"</bind>
      </rowfilter>
    </csvGrammar>
    <make table="epn_core">
      <rowmaker idmaps="*">
        <var key="service_title">"GMAP"</var>
        <var key="publisher">"Constructor University Bremen"</var>
        <var key="granule_uid" source="granule_uid"/>
        <var key="granule_gid" source="granule_gid"/>
        <var key="obs_id" source="obs_id"/>
        <var key="dataproduct_type" source="dataproduct_type"/>
        <var key="target_name" source="target_name"/>
        <var key="target_class" source="target_class"/>
        <var key="c1min" source="c1min"/>
        <var key="c1max" source="c1max"/>
        <var key="c2min" source="c2min"/>
        <var key="c2max" source="c2max"/>
        <var key="s_region" source="s_region"/>
        <var key="spatial_frame_type" source="spatial_frame_type"/>
        <var key="instrument_host_name">""</var>
        <var key="instrument_name">""</var>
        <var key="creation_date" source="publish_date"/>
        <var key="modification_date" source="publish_date"/>
        <var key="release_date" source="publish_date"/>
        <var key="processing_level">"5"</var>
        <var key="measurement_type" source="measurement_type"/>


        <apply procDef="//epntap2#populate-2_0" name="fillepn">
          <bind name="service_title">@service_title</bind>
          <bind name="granule_uid">@granule_uid</bind>
          <bind name="granule_gid">@granule_gid</bind>
          <bind name="obs_id">@obs_id</bind>
          <bind name="dataproduct_type">@dataproduct_type</bind>
          <bind name="target_name">@target_name</bind>
          <bind name="target_class">@target_class</bind>
          <bind name="c1min">@c1min</bind>
          <bind name="c1max">@c1max</bind>
          <bind name="c2min">@c2min</bind>
          <bind name="c2max">@c2max</bind>
          <bind name="s_region">@s_region</bind>
          <bind name="instrument_host_name">@instrument_host_name</bind>
          <bind name="instrument_name">@instrument_name</bind>
          <bind name="creation_date">@creation_date</bind>
          <bind name="modification_date">@modification_date</bind>
          <bind name="release_date">@release_date</bind>
          <bind name="processing_level">@processing_level</bind>
          <bind name="measurement_type">@measurement_type</bind>
        </apply>
      </rowmaker>
    </make>
  </data>
</resource>
