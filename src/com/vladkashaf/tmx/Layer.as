package com.vladkashaf.tmx 
{
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class Layer 
	{
		
		private var _xml:XML;
		private var _tiles:Array;
		
		public function Layer(xml:XML)
		{
			_xml = xml;
			_tiles = [];
			var tileXmlList:XMLList = _xml.data.tile;
			for (var i:int = 0; i < tileXmlList.length(); i++)
			{
				_tiles.push(new Tile(tileXmlList[i]));
			}
		}
		
		public function get name():String
		{
			return _xml.@name.toString();
		}
		
		public function get columnCount():int
		{
			return parseInt(_xml.@width.toString());
		}
		
		public function get tiles():Array
		{
			return _tiles;
		}
		
	}

}