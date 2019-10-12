# dj-react
The boilerplate code project on a web server with Django running on the back end and React running on the front end.

```sh
source setup.sh
```


## ISSUE

### static directory
`./frontend/static`을 지정해주지 않아 `js`, `cs` 로드되지 않아 빈 페이지 표시되는 현상 발견. 타이틀은 제대로 나오는 것 확인 후, 다음과 같이 코드 추가로 해결.

```python
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'frontend', 'build', 'static')
]
```

### git merge
```sh
find . -mindepth 2 -name '.git' -prune -exec rm -rf {} +
git rm -r --cached .
git add .
git commit -m "Apply .gitignore"
git push
```

### 형제 디렉토리 접근

> 참고 자료
- https://stackoverflow.com/questions/6323860/sibling-package-imports/50193944#50193944

> 이슈 내용

장고의 디렉토리 구성을 패키지 별로가 아니라 기능별로 묶고 싶었음. 그 중에 형제 레벨의 디렉토리에 파일이 필요해짐. 
정확히는 `./settings/urls.py`에서 `./views/views.py`를 호출해야 했음. `from ..views.views import index`처럼 당겨주면 될거 같았는데 `ValueError: attempted relative import beyond top-level package`에러가 출력 됨. 

```sh
│  manage.py
├─apps
│      apps.py
├─assets
├─models
│  └─ models.py
│
├─settings
│  │  admin.py
│  │  settings.py
│  │  urls.py
│  └─ wsgi.py
│
├─templates
│
├─uploads
└─views
    └─  views.py
```

해결 방법은 루트-`backend`-에  `setup.py` 파일을 만들어 주고 `pip install -e .`로 패키지화 하면 해결 가능.
```python
# ./setup.py
from setuptools import setup, find_packages

setup(name='backend', version='1.0', packages=find_packages())
```
