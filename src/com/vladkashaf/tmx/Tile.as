package com.vladkashaf.tmx 
{
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class Tile 
	{
		
		private var _xml:XML;
		
		public function Tile(xml:XML)
		{
			_xml = xml;
		}
		
		public function get gid():int
		{
			return parseInt(_xml.@gid.toString());
		}
		
	}

}