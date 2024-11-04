"
An OllamaAPITest is a test class for testing the behavior of OllamaAPI
"
Class {
	#name : 'OllamaAPITest',
	#superclass : 'TestCase',
	#instVars : [
		'ollama'
	],
	#category : 'Pharo-Ollama-Tests',
	#package : 'Pharo-Ollama-Tests'
}

{ #category : 'running' }
OllamaAPITest >> setUp [
	super setUp.
	ollama := OllamaAPI new.
]

{ #category : 'tests' }
OllamaAPITest >> testNumTokenVariables [
	
	| ollamatest |
	ollamatest := OllamaAPI new.
	self assert: (ollamatest num_ctx isNil).
	self assert: (((ollamatest prequery: 'test') at: #options) isEmptyOrNil).
	ollamatest num_ctx: 50.
	self assert: (ollamatest num_ctx == 50).
	self assert: (((ollamatest prequery: 'test') at: #options) isNotEmpty).
]

{ #category : 'running' }
OllamaAPITest >> testOllamaAPIHasDefaultModelInitialized [

	self assert: (ollama model isKindOf: OModel)
]
