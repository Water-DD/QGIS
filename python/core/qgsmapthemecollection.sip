/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapthemecollection.h                                     *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/






class QgsMapThemeCollection : QObject
{
%Docstring
 Container class that allows storage of map themes consisting of visible
map layers and layer styles.
.. versionadded:: 2.12
%End

%TypeHeaderCode
#include "qgsmapthemecollection.h"
%End
  public:

    class MapThemeLayerRecord
{
%Docstring
 Individual record of a visible layer in a map theme record.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsmapthemecollection.h"
%End
      public:
        MapThemeLayerRecord( QgsMapLayer *l = 0 );
%Docstring
Initialize layer record with a map layer - it will be stored as a weak pointer
%End

        bool operator==( const QgsMapThemeCollection::MapThemeLayerRecord &other ) const;
        bool operator!=( const QgsMapThemeCollection::MapThemeLayerRecord &other ) const;
%Docstring
 :rtype: bool
%End

        QgsMapLayer *layer() const;
%Docstring
Returns map layer or null if the layer does not exist anymore
 :rtype: QgsMapLayer
%End

        void setLayer( QgsMapLayer *layer );
%Docstring
Set the map layer for this record
%End

        bool usingCurrentStyle;
%Docstring
Whether current style is valid and should be applied
%End
        QString currentStyle;
%Docstring
Name of the current style of the layer
%End
        bool usingLegendItems;
%Docstring
Whether checkedLegendItems should be applied
%End
        QSet<QString> checkedLegendItems;
%Docstring
Rule keys of check legend items in layer tree model
%End
    };

    class MapThemeRecord
{
%Docstring
 Individual map theme record of visible layers and styles.

.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsmapthemecollection.h"
%End
      public:

        bool operator==( const QgsMapThemeCollection::MapThemeRecord &other ) const;
        bool operator!=( const QgsMapThemeCollection::MapThemeRecord &other ) const;
%Docstring
 :rtype: bool
%End

        QList<QgsMapThemeCollection::MapThemeLayerRecord> layerRecords() const;
%Docstring
Returns a list of records for all visible layer belonging to the theme.
 :rtype: list of QgsMapThemeCollection.MapThemeLayerRecord
%End

        void setLayerRecords( const QList<QgsMapThemeCollection::MapThemeLayerRecord> &records );
%Docstring
Sets layer records for the theme.
%End

        void removeLayerRecord( QgsMapLayer *layer );
%Docstring
Removes a record for ``layer`` if present.
%End

        void addLayerRecord( const QgsMapThemeCollection::MapThemeLayerRecord &record );
%Docstring
Add a new record for a layer.
%End


    };

    QgsMapThemeCollection( QgsProject *project = 0 );
%Docstring
 Create map theme collection that handles themes of the given project.
%End

    bool hasMapTheme( const QString &name ) const;
%Docstring
 Returns whether a map theme with a matching name exists.
.. versionadded:: 3.0
 :rtype: bool
%End

    void insert( const QString &name, const QgsMapThemeCollection::MapThemeRecord &state );
%Docstring
 Inserts a new map theme to the collection.
.. seealso:: :py:func:`update()`
%End

    void update( const QString &name, const QgsMapThemeCollection::MapThemeRecord &state );
%Docstring
 Updates a map theme within the collection.
 \param name name of map theme to update
 \param state map theme record to replace existing map theme
.. seealso:: :py:func:`insert()`
%End

    void removeMapTheme( const QString &name );
%Docstring
 Remove an existing map theme from collection.
.. versionadded:: 3.0
%End

    void clear();
%Docstring
Remove all map themes from the collection.
%End

    QStringList mapThemes() const;
%Docstring
 Returns a list of existing map theme names.
.. versionadded:: 3.0
 :rtype: list of str
%End

    QgsMapThemeCollection::MapThemeRecord mapThemeState( const QString &name ) const;
%Docstring
 Returns the recorded state of a map theme.
.. versionadded:: 3.0
 :rtype: QgsMapThemeCollection.MapThemeRecord
%End

    QStringList mapThemeVisibleLayerIds( const QString &name ) const;
%Docstring
 Returns the list of layer IDs that are visible for the specified map theme.

.. note::

   The order of the returned list is not guaranteed to reflect the order of layers
 in the canvas.
.. versionadded:: 3.0
 :rtype: list of str
%End

    QList<QgsMapLayer *> mapThemeVisibleLayers( const QString &name ) const;
%Docstring
 Returns the list of layers that are visible for the specified map theme.

.. note::

   The order of the returned list is not guaranteed to reflect the order of layers
 in the canvas.
.. versionadded:: 3.0
 :rtype: list of QgsMapLayer
%End

    QMap<QString, QString> mapThemeStyleOverrides( const QString &name );
%Docstring
 Get layer style overrides (for QgsMapSettings) of the visible layers for given map theme.
.. versionadded:: 3.0
 :rtype: QMap<str, QString>
%End

    void readXml( const QDomDocument &doc );
%Docstring
 Reads the map theme collection state from XML
 \param doc DOM document
.. seealso:: :py:func:`writeXml`
%End

    void writeXml( QDomDocument &doc );
%Docstring
 Writes the map theme collection state to XML.
 \param doc DOM document
.. seealso:: :py:func:`readXml`
%End

    static QgsMapThemeCollection::MapThemeRecord createThemeFromCurrentState( QgsLayerTreeGroup *root, QgsLayerTreeModel *model );
%Docstring
 Static method to create theme from the current state of layer visibilities in layer tree,
 current style of layers and check state of legend items (from a layer tree model).
.. versionadded:: 3.0
 :rtype: QgsMapThemeCollection.MapThemeRecord
%End

    void applyTheme( const QString &name, QgsLayerTreeGroup *root, QgsLayerTreeModel *model );
%Docstring
 Apply theme given by its name and modify layer tree, current style of layers and checked
 legend items of passed layer tree model.
.. versionadded:: 3.0
%End

    QgsProject *project();
%Docstring
 The QgsProject on which this map theme collection works.

.. versionadded:: 3.0
 :rtype: QgsProject
%End

    void setProject( QgsProject *project );
%Docstring
 \copydoc project()
.. versionadded:: 3.0
%End

    QList< QgsMapLayer * > masterLayerOrder() const;
%Docstring
 Returns the master layer order (this will always match the project's QgsProject.layerOrder() ).
 All map themes will maintain the same layer order as the master layer order.
.. versionadded:: 3.0
.. seealso:: :py:func:`masterVisibleLayers()`
 :rtype: list of QgsMapLayer
%End

    QList< QgsMapLayer * > masterVisibleLayers() const;
%Docstring
 Returns the master list of visible layers. The order of returned layers will always match those
 of masterLayerOrder(), but the returned layers are filtered to only include those visible
 in the project's layer tree.
.. versionadded:: 3.0
.. seealso:: :py:func:`masterLayerOrder()`
 :rtype: list of QgsMapLayer
%End

  signals:

    void mapThemesChanged();
%Docstring
 Emitted when map themes within the collection are changed.
.. versionadded:: 3.0
%End

    void mapThemeChanged( const QString &theme );
%Docstring
 Emitted when a map theme changes definition.
.. versionadded:: 3.0
%End

    void projectChanged();
%Docstring
 Emitted when the project changes

 \copydoc project()
.. versionadded:: 3.0
%End

};


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapthemecollection.h                                     *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
