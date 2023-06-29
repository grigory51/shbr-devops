from aiohttp import web
import os


async def handle(request):
    name = request.match_info.get('name', "")
    return web.Response(text=f'{os.getenv("PREFIX", "")}{name}\n',
                        headers={'X-Shbr-Lang': 'python'})


app = web.Application()
app.add_routes([
    web.get('/', handle),
    web.get('/{name}', handle)
])

if __name__ == '__main__':
    web.run_app(app, host=os.getenv('HOST', '0.0.0.0'), port=int(os.getenv('PORT', 10000)))
