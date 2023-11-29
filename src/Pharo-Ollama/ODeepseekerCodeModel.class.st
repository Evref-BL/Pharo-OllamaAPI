Class {
	#name : #ODeepseekerCodeModel,
	#superclass : #OModel,
	#category : #'Pharo-Ollama'
}

{ #category : #'as yet unclassified' }
ODeepseekerCodeModel class >> b33 [

	^ self new
		  tag: '33b';
		  yourself
]

{ #category : #'as yet unclassified' }
ODeepseekerCodeModel class >> b6 [

	^ self new
		  tag: '6.7b';
		  yourself
]

{ #category : #accessing }
ODeepseekerCodeModel >> name [

	^ 'deepseek-coder'
]
