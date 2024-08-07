Class {
	#name : 'OPhi3Model',
	#superclass : 'OModel',
	#category : 'Pharo-Ollama',
	#package : 'Pharo-Ollama'
}

{ #category : 'accessing' }
OPhi3Model class >> medium [

	<ollamaInit: 'phi3:medium'>
	^ self new
		  tag: 'medium';
		  yourself
]

{ #category : 'accessing' }
OPhi3Model class >> mini [

	<ollamaInit: 'phi3:mini'>
	^ self new
		  tag: 'mini';
		  yourself
]

{ #category : 'accessing' }
OPhi3Model >> name [

	^ 'phi3'
]
