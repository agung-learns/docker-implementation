from fastapi import APIRouter

user_router = APIRouter(tags=["user"])

from . import views, models # noqa
