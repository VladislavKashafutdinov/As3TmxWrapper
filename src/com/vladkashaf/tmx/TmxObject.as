package com.vladkashaf.tmx 
{
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class TmxObject 
	{
		
		private var _xml:XML;
		
		public function TmxObject(xml:XML) 
		{
			_xml = xml;
		}
		
		public function get name():String
		{
			return _xml.@name.toString();
		}
		
		public function get type():String
		{
			return _xml.@type.toString();
		}
		
		public function get x():Number
		{
			return parseInt(_xml.@x.toString());
		}
		
		public function get y():Number
		{
			return parseInt(_xml.@y.toString());
		}
		
		public function get width():Number
		{
			return parseInt(_xml.@width.toString());
		}
		
		public function get height():Number
		{
			return parseInt(_xml.@height.toString());
		}
		
	}

}