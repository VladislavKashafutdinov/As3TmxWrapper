package com.vladkashaf.tmx 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class Tileset 
	{
		
		private var _xml:XML;
		private var _width:int;
		private var _height:int;
		
		public function Tileset(xml:XML)
		{
			_xml = xml;
			_width = parseInt(_xml.image.@width.toString());
			_height = parseInt(_xml.image.@height.toString());
		}
		
		public function get firstGid():int
		{
			return parseInt(_xml.@firstgid.toString());
		}
		
		public function get name():String
		{
			return _xml.@name.toString();
		}
		
		public function get tileWidth():int
		{
			return parseInt(_xml.@tilewidth.toString());
		}
		
		public function get tileHeight():int
		{
			return parseInt(_xml.@tileheight.toString());
		}
		
		public function getTileNumber(tileGid:int):int
		{
			return tileGid - firstGid;
		}
		
		/**
		 * Generates rectangle for a tile, specified by its number within tileset
		 * @param	tileNumber is a number of tile inside of current tileset. Don't confuse with tile gid. Tile number can be calculated by this way: tileNumber == (tileGid - tilesetFirstGid)
		 * @return just created rectanlge of tile
		 */
		public function getTileRegion(tileNumber:int):Rectangle
		{
			var columnCount:int = int(_width / tileWidth);
			var tileColumn:int = tileNumber % columnCount;
			var tileRow:int = int(tileNumber / columnCount);
			var tileRegion:Rectangle = new Rectangle(tileColumn * tileWidth, tileRow * tileHeight, tileWidth, tileHeight);
			return tileRegion;
		}
		
	}

}