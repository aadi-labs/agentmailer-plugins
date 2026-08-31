import Foundation
import Testing
import AgentMailer

@Suite("A2AClient Wire Tests") struct A2AClientWireTests {
    @Test func sendTask1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "key": "value"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "key": JSONValue.string("value")
        ]
        let response = try await client.a2A.sendTask(
            handle: "handle",
            request: .init(
                jsonrpc: .two0,
                id: .null,
                method: "method"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func sendTask2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "string": {
                    "key": "value"
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "string": JSONValue.object(
                [
                    "key": JSONValue.string("value")
                ]
            )
        ]
        let response = try await client.a2A.sendTask(
            handle: "handle",
            request: .init(
                jsonrpc: .two0,
                id: .null,
                method: "x"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getAgentCard1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "name": "name",
                  "description": "description",
                  "supportedInterfaces": [
                    {
                      "url": "url",
                      "protocolBinding": "JSONRPC",
                      "protocolVersion": "1.0"
                    }
                  ],
                  "provider": {
                    "url": "url",
                    "organization": "organization"
                  },
                  "version": "version",
                  "documentationUrl": "documentationUrl",
                  "capabilities": {
                    "streaming": true,
                    "pushNotifications": true,
                    "extendedAgentCard": true
                  },
                  "securitySchemes": {
                    "key": "value"
                  },
                  "securityRequirements": [
                    {
                      "key": [
                        "value"
                      ]
                    }
                  ],
                  "defaultInputModes": [
                    "defaultInputModes"
                  ],
                  "defaultOutputModes": [
                    "defaultOutputModes"
                  ],
                  "skills": [
                    {
                      "id": "id",
                      "name": "name",
                      "description": "description",
                      "tags": [
                        "tags"
                      ],
                      "examples": [
                        "examples"
                      ],
                      "inputModes": [
                        "inputModes"
                      ],
                      "outputModes": [
                        "outputModes"
                      ]
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = A2AAgentCard(
            name: "name",
            description: "description",
            supportedInterfaces: [
                A2AAgentCardSupportedInterfacesItem(
                    url: "url",
                    protocolBinding: A2AAgentCardSupportedInterfacesItemProtocolBinding.jsonrpc,
                    protocolVersion: A2AAgentCardSupportedInterfacesItemProtocolVersion.one0
                )
            ],
            provider: A2AAgentCardProvider(
                url: "url",
                organization: "organization"
            ),
            version: "version",
            documentationUrl: "documentationUrl",
            capabilities: A2AAgentCardCapabilities(
                streaming: true,
                pushNotifications: true,
                extendedAgentCard: true
            ),
            securitySchemes: [
                "key": JSONValue.string("value")
            ],
            securityRequirements: [
                [
                    "key": [
                        "value"
                    ]
                ]
            ],
            defaultInputModes: [
                "defaultInputModes"
            ],
            defaultOutputModes: [
                "defaultOutputModes"
            ],
            skills: [
                A2AAgentCardSkillsItem(
                    id: "id",
                    name: "name",
                    description: "description",
                    tags: [
                        "tags"
                    ],
                    examples: Optional([
                        "examples"
                    ]),
                    inputModes: Optional([
                        "inputModes"
                    ]),
                    outputModes: Optional([
                        "outputModes"
                    ])
                )
            ]
        )
        let response = try await client.a2A.getAgentCard(
            handle: "handle",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getAgentCard2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "name": "name",
                  "description": "description",
                  "supportedInterfaces": [
                    {
                      "url": "url",
                      "protocolBinding": "JSONRPC",
                      "protocolVersion": "1.0"
                    },
                    {
                      "url": "url",
                      "protocolBinding": "JSONRPC",
                      "protocolVersion": "1.0"
                    }
                  ],
                  "provider": {
                    "url": "url",
                    "organization": "organization"
                  },
                  "version": "version",
                  "documentationUrl": "documentationUrl",
                  "capabilities": {
                    "streaming": true,
                    "pushNotifications": true,
                    "extendedAgentCard": true
                  },
                  "securitySchemes": {
                    "securitySchemes": {
                      "key": "value"
                    }
                  },
                  "securityRequirements": [
                    {
                      "securityRequirements": [
                        "securityRequirements",
                        "securityRequirements"
                      ]
                    },
                    {
                      "securityRequirements": [
                        "securityRequirements",
                        "securityRequirements"
                      ]
                    }
                  ],
                  "defaultInputModes": [
                    "defaultInputModes",
                    "defaultInputModes"
                  ],
                  "defaultOutputModes": [
                    "defaultOutputModes",
                    "defaultOutputModes"
                  ],
                  "skills": [
                    {
                      "id": "x",
                      "name": "x",
                      "description": "x",
                      "tags": [
                        "tags",
                        "tags"
                      ],
                      "examples": [
                        "examples",
                        "examples"
                      ],
                      "inputModes": [
                        "inputModes",
                        "inputModes"
                      ],
                      "outputModes": [
                        "outputModes",
                        "outputModes"
                      ]
                    },
                    {
                      "id": "x",
                      "name": "x",
                      "description": "x",
                      "tags": [
                        "tags",
                        "tags"
                      ],
                      "examples": [
                        "examples",
                        "examples"
                      ],
                      "inputModes": [
                        "inputModes",
                        "inputModes"
                      ],
                      "outputModes": [
                        "outputModes",
                        "outputModes"
                      ]
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = A2AAgentCard(
            name: "name",
            description: "description",
            supportedInterfaces: [
                A2AAgentCardSupportedInterfacesItem(
                    url: "url",
                    protocolBinding: A2AAgentCardSupportedInterfacesItemProtocolBinding.jsonrpc,
                    protocolVersion: A2AAgentCardSupportedInterfacesItemProtocolVersion.one0
                ),
                A2AAgentCardSupportedInterfacesItem(
                    url: "url",
                    protocolBinding: A2AAgentCardSupportedInterfacesItemProtocolBinding.jsonrpc,
                    protocolVersion: A2AAgentCardSupportedInterfacesItemProtocolVersion.one0
                )
            ],
            provider: A2AAgentCardProvider(
                url: "url",
                organization: "organization"
            ),
            version: "version",
            documentationUrl: "documentationUrl",
            capabilities: A2AAgentCardCapabilities(
                streaming: true,
                pushNotifications: true,
                extendedAgentCard: true
            ),
            securitySchemes: [
                "securitySchemes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            securityRequirements: [
                [
                    "securityRequirements": [
                        "securityRequirements",
                        "securityRequirements"
                    ]
                ],
                [
                    "securityRequirements": [
                        "securityRequirements",
                        "securityRequirements"
                    ]
                ]
            ],
            defaultInputModes: [
                "defaultInputModes",
                "defaultInputModes"
            ],
            defaultOutputModes: [
                "defaultOutputModes",
                "defaultOutputModes"
            ],
            skills: [
                A2AAgentCardSkillsItem(
                    id: "x",
                    name: "x",
                    description: "x",
                    tags: [
                        "tags",
                        "tags"
                    ],
                    examples: Optional([
                        "examples",
                        "examples"
                    ]),
                    inputModes: Optional([
                        "inputModes",
                        "inputModes"
                    ]),
                    outputModes: Optional([
                        "outputModes",
                        "outputModes"
                    ])
                ),
                A2AAgentCardSkillsItem(
                    id: "x",
                    name: "x",
                    description: "x",
                    tags: [
                        "tags",
                        "tags"
                    ],
                    examples: Optional([
                        "examples",
                        "examples"
                    ]),
                    inputModes: Optional([
                        "inputModes",
                        "inputModes"
                    ]),
                    outputModes: Optional([
                        "outputModes",
                        "outputModes"
                    ])
                )
            ]
        )
        let response = try await client.a2A.getAgentCard(
            handle: "handle",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateTask1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "task": {
                    "id": "id",
                    "contextId": "contextId",
                    "status": {
                      "state": "TASK_STATE_SUBMITTED",
                      "timestamp": "2024-01-15T09:30:00Z",
                      "message": {
                        "messageId": "messageId",
                        "role": "ROLE_USER",
                        "parts": [
                          {}
                        ]
                      }
                    },
                    "artifacts": [
                      {
                        "artifactId": "artifactId",
                        "parts": [
                          {}
                        ]
                      }
                    ],
                    "history": [
                      {
                        "messageId": "messageId",
                        "role": "ROLE_USER",
                        "parts": [
                          {}
                        ]
                      }
                    ],
                    "metadata": {
                      "key": "value"
                    }
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateTaskA2AResponse(
            task: A2ATask(
                id: "id",
                contextId: "contextId",
                status: A2ATaskStatus(
                    state: A2ATaskStatusState.taskStateSubmitted,
                    timestamp: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    message: Optional(A2ATaskStatusMessage(
                        messageId: "messageId",
                        role: A2ATaskStatusMessageRole.roleUser,
                        parts: [
                            A2ATaskStatusMessagePartsItem(

                            )
                        ]
                    ))
                ),
                artifacts: Optional([
                    A2ATaskArtifactsItem(
                        artifactId: "artifactId",
                        parts: [
                            A2ATaskArtifactsItemPartsItem(

                            )
                        ]
                    )
                ]),
                history: Optional([
                    A2ATaskHistoryItem(
                        messageId: "messageId",
                        role: A2ATaskHistoryItemRole.roleUser,
                        parts: [
                            A2ATaskHistoryItemPartsItem(

                            )
                        ]
                    )
                ]),
                metadata: Optional([
                    "key": JSONValue.string("value")
                ])
            )
        )
        let response = try await client.a2A.updateTask(
            taskId: "taskId",
            request: .init(state: .taskStateSubmitted),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateTask2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "task": {
                    "id": "x",
                    "contextId": "x",
                    "status": {
                      "state": "TASK_STATE_SUBMITTED",
                      "timestamp": "2024-01-15T09:30:00Z",
                      "message": {
                        "messageId": "x",
                        "contextId": "x",
                        "taskId": "x",
                        "role": "ROLE_USER",
                        "parts": [
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          },
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          }
                        ],
                        "metadata": {
                          "metadata": {
                            "key": "value"
                          }
                        },
                        "extensions": [
                          "extensions",
                          "extensions"
                        ],
                        "referenceTaskIds": [
                          "referenceTaskIds",
                          "referenceTaskIds"
                        ]
                      }
                    },
                    "artifacts": [
                      {
                        "artifactId": "x",
                        "name": "x",
                        "description": "description",
                        "parts": [
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          },
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          }
                        ],
                        "metadata": {
                          "metadata": {
                            "key": "value"
                          }
                        },
                        "extensions": [
                          "extensions",
                          "extensions"
                        ]
                      },
                      {
                        "artifactId": "x",
                        "name": "x",
                        "description": "description",
                        "parts": [
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          },
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          }
                        ],
                        "metadata": {
                          "metadata": {
                            "key": "value"
                          }
                        },
                        "extensions": [
                          "extensions",
                          "extensions"
                        ]
                      }
                    ],
                    "history": [
                      {
                        "messageId": "x",
                        "contextId": "x",
                        "taskId": "x",
                        "role": "ROLE_USER",
                        "parts": [
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          },
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          }
                        ],
                        "metadata": {
                          "metadata": {
                            "key": "value"
                          }
                        },
                        "extensions": [
                          "extensions",
                          "extensions"
                        ],
                        "referenceTaskIds": [
                          "referenceTaskIds",
                          "referenceTaskIds"
                        ]
                      },
                      {
                        "messageId": "x",
                        "contextId": "x",
                        "taskId": "x",
                        "role": "ROLE_USER",
                        "parts": [
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          },
                          {
                            "text": "text",
                            "raw": "raw",
                            "url": "url",
                            "data": {
                              "key": "value"
                            },
                            "metadata": {
                              "metadata": {
                                "key": "value"
                              }
                            },
                            "filename": "x",
                            "mediaType": "x"
                          }
                        ],
                        "metadata": {
                          "metadata": {
                            "key": "value"
                          }
                        },
                        "extensions": [
                          "extensions",
                          "extensions"
                        ],
                        "referenceTaskIds": [
                          "referenceTaskIds",
                          "referenceTaskIds"
                        ]
                      }
                    ],
                    "metadata": {
                      "metadata": {
                        "key": "value"
                      }
                    }
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateTaskA2AResponse(
            task: A2ATask(
                id: "x",
                contextId: "x",
                status: A2ATaskStatus(
                    state: A2ATaskStatusState.taskStateSubmitted,
                    timestamp: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    message: Optional(A2ATaskStatusMessage(
                        messageId: "x",
                        contextId: Optional("x"),
                        taskId: Optional("x"),
                        role: A2ATaskStatusMessageRole.roleUser,
                        parts: [
                            A2ATaskStatusMessagePartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            ),
                            A2ATaskStatusMessagePartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            )
                        ],
                        metadata: Optional([
                            "metadata": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]),
                        extensions: Optional([
                            "extensions",
                            "extensions"
                        ]),
                        referenceTaskIds: Optional([
                            "referenceTaskIds",
                            "referenceTaskIds"
                        ])
                    ))
                ),
                artifacts: Optional([
                    A2ATaskArtifactsItem(
                        artifactId: "x",
                        name: Optional("x"),
                        description: Optional("description"),
                        parts: [
                            A2ATaskArtifactsItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            ),
                            A2ATaskArtifactsItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            )
                        ],
                        metadata: Optional([
                            "metadata": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]),
                        extensions: Optional([
                            "extensions",
                            "extensions"
                        ])
                    ),
                    A2ATaskArtifactsItem(
                        artifactId: "x",
                        name: Optional("x"),
                        description: Optional("description"),
                        parts: [
                            A2ATaskArtifactsItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            ),
                            A2ATaskArtifactsItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            )
                        ],
                        metadata: Optional([
                            "metadata": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]),
                        extensions: Optional([
                            "extensions",
                            "extensions"
                        ])
                    )
                ]),
                history: Optional([
                    A2ATaskHistoryItem(
                        messageId: "x",
                        contextId: Optional("x"),
                        taskId: Optional("x"),
                        role: A2ATaskHistoryItemRole.roleUser,
                        parts: [
                            A2ATaskHistoryItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            ),
                            A2ATaskHistoryItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            )
                        ],
                        metadata: Optional([
                            "metadata": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]),
                        extensions: Optional([
                            "extensions",
                            "extensions"
                        ]),
                        referenceTaskIds: Optional([
                            "referenceTaskIds",
                            "referenceTaskIds"
                        ])
                    ),
                    A2ATaskHistoryItem(
                        messageId: "x",
                        contextId: Optional("x"),
                        taskId: Optional("x"),
                        role: A2ATaskHistoryItemRole.roleUser,
                        parts: [
                            A2ATaskHistoryItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            ),
                            A2ATaskHistoryItemPartsItem(
                                text: Optional("text"),
                                raw: Optional("raw"),
                                url: Optional("url"),
                                data: Optional(JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )),
                                metadata: Optional([
                                    "metadata": JSONValue.object(
                                        [
                                            "key": JSONValue.string("value")
                                        ]
                                    )
                                ]),
                                filename: Optional("x"),
                                mediaType: Optional("x")
                            )
                        ],
                        metadata: Optional([
                            "metadata": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]),
                        extensions: Optional([
                            "extensions",
                            "extensions"
                        ]),
                        referenceTaskIds: Optional([
                            "referenceTaskIds",
                            "referenceTaskIds"
                        ])
                    )
                ]),
                metadata: Optional([
                    "metadata": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ])
            )
        )
        let response = try await client.a2A.updateTask(
            taskId: "taskId",
            request: .init(state: .taskStateSubmitted),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateIdentity1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "key": "value"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "key": JSONValue.string("value")
        ]
        let response = try await client.a2A.updateIdentity(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateIdentity2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "string": {
                    "key": "value"
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "string": JSONValue.object(
                [
                    "key": JSONValue.string("value")
                ]
            )
        ]
        let response = try await client.a2A.updateIdentity(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}