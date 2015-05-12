package com.vladkashaf.tmx 
{
	/**
	 * ...
	 * @author Kashafuutdinov Vladislav
	 */
	public class ObjectGroup 
	{
		
		private var _xml:XML;
		private var _objects:Array;
		
		public function ObjectGroup(xml:XML) 
		{
			_xml = xml;
			_objects = [];
			var objectsXmlList:XMLList = _xml.object;
			for (var i:int = 0; i < objectsXmlList.length(); i++) 
			{
				_objects.push(new TmxObject(objectsXmlList[i]));
			}
		}
		
		public function get name():String
		{
			return _xml.@name.toString();
		}
		
		public function get objects():Array
		{
			return _objects;
		}
		
		public function findObject(name:String):TmxObject
		{
			var filtered:Array = _objects.filter(function (o:TmxObject,i:int,arr:Array):Boolean 
			{
				return o.name == name;
			});
			return filtered.length == 0
				? null
				: filtered[0];
		}
		
	}

}