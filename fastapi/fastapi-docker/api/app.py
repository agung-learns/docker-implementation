from fastapi import FastAPI


def create_app() -> FastAPI:
    app = FastAPI()
    register_routers(app)
    return app


def register_routers(app: FastAPI) -> None:
    from api.apps import user_router

    app.include_router(user_router)
