package com.vladkashaf.tmx 
{
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class Map 
	{
		
		private var _xml:XML;
		private var _layers:Array;
		private var _tilesets:Array;
		private var _objectGroups:Array;
		
		public function Map(xml:XML )
		{
			_xml = xml;
			_layers = [];
			_tilesets = [];
			_objectGroups = [];
			var layersXmlList:XMLList = _xml.layer;
			for (var i:int = 0; i < layersXmlList.length(); i++) 
			{
				_layers.push(new Layer(layersXmlList[i]));
			}
			var tilesetXmlList:XMLList = _xml.tileset;
			for (i = 0; i < tilesetXmlList.length(); i++) 
			{
				_tilesets.push(new Tileset(tilesetXmlList[i]))
			}
			var objectGrupXmlList:XMLList = _xml.objectgroup;
			for (i = 0; i < objectGrupXmlList.length(); i++) 
			{
				_objectGroups.push(new ObjectGroup(objectGrupXmlList[i]))
			}
		}
		
		public function findObjectGroup(name:String):ObjectGroup
		{
			var filtered:Array = _objectGroups.filter(function(og:ObjectGroup, i:int, arr:Array):Boolean
			{ 
				return og.name == name; 
			});
			return filtered.length == 0 ? null : filtered[0];
		}
		
		public function findLayer(name:String):Layer
		{
			var filtered:Array = _layers.filter(function(l:Layer, i:int, arr:Array):Boolean
			{
				return l.name == name;
			});
			return filtered.length == 0 ? null : filtered[0];
		}
		
		public function findTilesetByTileGid(gid:int):Tileset
		{
			var filtered:Array = _tilesets.filter(function(tileset:Tileset, i:int, arr:Array):Boolean
			{
				return tileset.firstGid <= gid;
			});
			return filtered.length == 0 ? null : filtered[filtered.length - 1];
		}
		
		public function getTileX(tileNumber:int, layer:Layer):int
		{
			return tileNumber % layer.columnCount * tileWidth;
		}
		
		public function getTileY(tileNumber:int, layer:Layer):Number
		{
			return int(tileNumber / layer.columnCount) * tileHeight;
		}
		
		public function get layers():Array
		{
			return _layers;
		}
		
		public function get columnCount():int
		{
			return parseInt(_xml.@width.toString());
		}
		
		public function get tileWidth():int
		{
			return parseInt(_xml.@tilewidth.toString());
		}
		
		public function get tileHeight():int
		{
			return parseInt(_xml.@tileheight.toString());
		}
		
	}

}