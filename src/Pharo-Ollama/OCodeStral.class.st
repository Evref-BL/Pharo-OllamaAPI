Class {
	#name : 'OCodeStral',
	#superclass : 'OModel',
	#category : 'Pharo-Ollama',
	#package : 'Pharo-Ollama'
}

{ #category : 'as yet unclassified' }
OCodeStral class >> codestral22b [

	<ollamaInit: 'codestral:22b'>
	^ self new
		  tag: '22b';
		  yourself
]

{ #category : 'accessing' }
OCodeStral >> name [

	^ 'codestral'
]
