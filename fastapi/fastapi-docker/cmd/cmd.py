import subprocess

import click
import uvicorn
from api.app import create_app

app = create_app()


@click.group()
def cli():
    pass


@cli.command()
@click.option("--host", default="localhost", help="Host to bind the server to.")
@click.option("--port", default=8000, help="Port to bind the server to.")
@click.option("--prod", default=False, help="Run in production mode.")
def runserver(host: str, port: int, prod: bool) -> None:
    click.echo(f"Starting server on {host}:{port}")
    uvicorn.run(app, host=host, port=port)


@cli.group()
def migrations():
    pass


@migrations.command()
def generate():
    subprocess.run(["alembic", "revision", "--autogenerate"])


@migrations.command()
def up():
    subprocess.run(["alembic", "upgrade", "head"])


@migrations.command()
def down():
    subprocess.run(["alembic", "downgrade", "-1"])
