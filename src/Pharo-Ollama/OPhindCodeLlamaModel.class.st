Class {
	#name : 'OPhindCodeLlamaModel',
	#superclass : 'OModel',
	#category : 'Pharo-Ollama',
	#package : 'Pharo-Ollama'
}

{ #category : 'accessing' }
OPhindCodeLlamaModel class >> b7 [

	<ollamaInit: 'phind-codellama:34b-v2'>
	^ self new
		  tag: '34b-v2';
		  yourself
]

{ #category : 'accessing' }
OPhindCodeLlamaModel >> name [
	^ 'phind-codellama'
]
