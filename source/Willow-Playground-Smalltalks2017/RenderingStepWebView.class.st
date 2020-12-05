"
I'm a step showing the rendering basics.
"
Class {
	#name : #RenderingStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
RenderingStepWebView >> codeToRenderBlock: aBlock on: aCanvas [
aCanvas render: aBlock
]

{ #category : #'private-accessing' }
RenderingStepWebView >> codeToRenderComponent: aWillowComponent on: aCanvas [
aCanvas render: aWillowComponent
]

{ #category : #'private-accessing' }
RenderingStepWebView >> codeToRenderStringOn: aCanvas [
aCanvas render: 'A simple string'
]

{ #category : #accessing }
RenderingStepWebView >> description [

	^ 'Willow components can be easily rendered'
]

{ #category : #rendering }
RenderingStepWebView >> renderContentOn: aCanvas [

	self
		renderPanelWrapping: [ self renderSourceOf: #codeToRenderStringOn: on: aCanvas.
			self renderSourceOf: #codeToRenderBlock:on: on: aCanvas.
			self renderSourceOf: #codeToRenderComponent:on: on: aCanvas ]
		on: aCanvas
]

{ #category : #accessing }
RenderingStepWebView >> shortName [

	^ 'Rendering'
]
