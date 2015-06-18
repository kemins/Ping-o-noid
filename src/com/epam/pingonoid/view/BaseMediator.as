package com.epam.pingonoid.view
{
	import com.epam.pingonoid.view.interfaces.IResetViewMediator;
	import com.epam.pingonoid.view.interfaces.ISetupViewMediator;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 
	 * Here we can place all common logic for our mediators.
	 * 
	 */
	
	public class BaseMediator extends Mediator implements IResetViewMediator, ISetupViewMediator
	{
		/**
		 * Hold references to sub-mediators.
		 */		
		public var subMediators:Array;
		
		/**
		 * Constructor 
		 * 
		 * @param mediatorName
		 * @param viewComponent
		 * 
		 */		
		public function BaseMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		/**
		 * Template method.
		 * 
		 * Define flow for creating sub-mediators.
		 * 
		 */		
		override public function onRegister() : void
		{
			super.onRegister();
			
			subMediators = createSubMediators();
			
			for each(var subMediator:IMediator in subMediators)
			{
				facade.registerMediator(subMediator);
			}
		}
		
		/**
		 * Template method.
		 * 
		 * Define flow for removing sub-mediators and de-attaching listeners.
		 * 
		 */		
		override public function onRemove() : void
		{
			super.onRemove();
			
			removeEventListeners();
			
			removeSubMediators();
		}
		
		/**
		 * If resetSubViews is true reset all sub mediators.
		 * 
		 * @param resetSubViews
		 * 
		 */		
		public function resetView(resetSubViews:Boolean = true) : void
		{
			if( resetSubViews )
			{
				for each (var subMediator:IMediator in subMediators)
				{
					if(subMediator is IResetViewMediator)
					{
						(subMediator as IResetViewMediator).resetView();
					}
				}
			}
		}

		public function setupView() : void
		{
			addEventListeners();
		}		
		
		/**
		 *	Add view event listeners.
		 * 
		 */		
		protected function addEventListeners() : void {}
		
		/**
		 *	Remove view event listeners. 
		 * 
		 */		
		protected function removeEventListeners() : void {}
		
		/**
		 * 
		 * @return array of sub-mediators. 
		 * 
		 */		
		protected function createSubMediators() : Array 
		{
			return [];
		}
		
		
		/**
		 *  Remove all sub-mediators. 
		 * 
		 */		
		protected function removeSubMediators() : void 
		{
			for each(var subMediator:IMediator in subMediators)
			{
				facade.removeMediator( subMediator.getMediatorName() );
			}
		}
		
		
		
	}
}