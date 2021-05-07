├── container-image-creation
│   ├── todo-backend
│   │   ├── backend
│   │   │   ├── bin
│   │   │   │   └── www
│   │   │   ├── package.json
│   │   │   ├── package-lock.json
│   │   │   └── src
│   │   │       ├── api.js
│   │   │       ├── create.js
│   │   │       └── database.js
│   │   ├── backend-final.lua
│   │   ├── backend-test.lua            <--- test container image creation script
│   │   ├── fuzz
│   │   │   └── api.test.js             <--- code for fuzzing
│   │   └── test
│   │       ├── api.test.js             <--- code for unit testing backend
│   │       └── jest.json
│   └── todo-frontend
│       ├── frontend
│       │   ├── package.json
│       │   ├── package-lock.json
│       │   ├── public
│       │   │   └── index.html
│       │   └── src
│       │       ├── index.js
│       │       ├── setupTests.js
│       │       └── Todos.js
│       ├── frontend-final.lua
│       ├── frontend-test.lua           <--- test container image creation script
│       └── test
│           ├── babel.config.json
│           ├── jest.json
│           └── Todos.test.js           <--- code for unit testing frontend
└── runner
    ├── backend.lua                     <--- backend test script
    └── frontend.lua                    <--- frontend test script
