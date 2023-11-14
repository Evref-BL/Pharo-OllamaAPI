Class {
	#name : #OllamaAPI,
	#superclass : #Object,
	#instVars : [
		'model',
		'host',
		'port',
		'stream',
		'temperature',
		'num_predict',
		'top_k',
		'top_p'
	],
	#category : #'Pharo-Ollama'
}

{ #category : #private }
OllamaAPI >> addParameterTo: paramDic [

	| options |
	options := Dictionary new.
	paramDic at: #options put: options.
	self temperature ifNotNil: [ :var |
		options at: #temperature put: var asFloat ].
	self num_predict ifNotNil: [ :var |
		options at: #num_predict put: var ].
	self top_k ifNotNil: [ :var | options at: #top_k put: var ].
	self top_p ifNotNil: [ :var | options at: #top_p put: var ]
]

{ #category : #private }
OllamaAPI >> buildQuery: aTextQuery [
	^ 'Complete the following piece of code 
', aTextQuery 
]

{ #category : #api }
OllamaAPI >> delete [
	"Pull the model linked to this API"

	| znClient paramDic |
	znClient := ZnEasy client.
	znClient forJsonREST.
	znClient host: self host.
	znClient port: self port.
	znClient path: 'api/delete'.
	paramDic := Dictionary new.
	paramDic at: #name put: self model fullName.
	znClient entity: (ZnEntity json: (NeoJSONWriter toString: paramDic)).
	^ znClient delete
]

{ #category : #accessing }
OllamaAPI >> host [

	^ host
]

{ #category : #accessing }
OllamaAPI >> host: anObject [

	host := anObject
]

{ #category : #initialization }
OllamaAPI >> initialize [

	super initialize.
	host := '127.0.0.1'.
	port := 11434.
	model := OCodeLlamaModel new.
	stream := false
]

{ #category : #api }
OllamaAPI >> list [
	"Pull the model linked to this API"

	| znClient |
	znClient := ZnEasy client.
	znClient forJsonREST.
	znClient host: self host.
	znClient port: self port.
	znClient path: 'api/tags'.
	^ znClient get
]

{ #category : #accessing }
OllamaAPI >> model [

	^ model
]

{ #category : #accessing }
OllamaAPI >> model: anObject [

	model := anObject
]

{ #category : #accessing }
OllamaAPI >> num_predict [

	^ num_predict
]

{ #category : #accessing }
OllamaAPI >> num_predict: anObject [

	num_predict := anObject
]

{ #category : #accessing }
OllamaAPI >> port [

	^ port
]

{ #category : #accessing }
OllamaAPI >> port: anObject [

	port := anObject
]

{ #category : #api }
OllamaAPI >> pull [
	"Pull the model linked to this API"

	| znClient paramDic |
	znClient := ZnEasy client.
	znClient forJsonREST.
	znClient host: self host.
	znClient port: self port.
	znClient path: 'api/pull'.
	paramDic := Dictionary new.
	paramDic at: #name put: self model fullName.
	paramDic at: #stream put: false.
	znClient entity: (ZnEntity json: (NeoJSONWriter toString: paramDic)).
	^ znClient post at: #response
]

{ #category : #api }
OllamaAPI >> query: aTextQuery [

	| znClient paramDic |
	znClient := ZnClient new.
	znClient host: self host.
	znClient port: self port.
	znClient path: 'api/generate'.
	paramDic := Dictionary new.
	paramDic at: #model put: self model fullName.
	paramDic at: #prompt put: (self buildQuery: aTextQuery).
	paramDic at: #stream put: self stream.

	self addParameterTo: paramDic.
	znClient entity: (ZnEntity json: (NeoJSONWriter toString: paramDic)).

	self stream
		ifTrue: [
			| writer |
			writer := ZnUtils defaultJSONWriter.
			znClient
				accept: ZnMimeType applicationJson;
				contentWriter: [ :data | ZnEntity json: (writer toString: data) ].
			znClient streaming: true.
			^ znClient post ]
		ifFalse: [
			znClient forJsonREST.
			^ znClient post at: #response ]
]

{ #category : #accessing }
OllamaAPI >> stream [

	^ stream
]

{ #category : #accessing }
OllamaAPI >> stream: anObject [

	stream := anObject
]

{ #category : #accessing }
OllamaAPI >> temperature [

	^ temperature
]

{ #category : #accessing }
OllamaAPI >> temperature: anObject [

	temperature := anObject
]

{ #category : #accessing }
OllamaAPI >> top_k [

	^ top_k
]

{ #category : #accessing }
OllamaAPI >> top_k: anObject [

	top_k := anObject
]

{ #category : #accessing }
OllamaAPI >> top_p [

	^ top_p
]

{ #category : #accessing }
OllamaAPI >> top_p: anObject [

	top_p := anObject
]
