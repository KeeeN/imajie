FROM python:3.10
ENV PYTHONUNBUFFERED=1\
    PYTHONDONTWRITEBYTECODE=1
WORKDIR /code
COPY ./pyproject.toml ./poetry.lock /code/
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install
COPY ./app/ /code/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8801", "--reload"]