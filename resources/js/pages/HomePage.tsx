export default function HomePage() {
    return (
        <div className="home-page">
            {/* Hero Section */}
            <section className="home-hero">
                <div className="container">
                    <h1>Bienvenido a Eunoia</h1>
                    <p>
                        Una plataforma moderna construida con Laravel y React para crear experiencias excepcionales.
                    </p>
                    <div className="mt-8">
                        <button className="btn btn-primary btn-lg mr-4">
                            Comenzar
                        </button>
                        <button className="btn btn-outline btn-lg">
                            Saber más
                        </button>
                    </div>
                </div>
            </section>

            {/* Content Section */}
            <section className="p-8">
                <div className="container">                    <div className="grid grid-cols-1 gap-6 content-centered">
                        <div className="card">
                            <div className="card-body text-center">
                                <h2 className="text-2xl font-semibold mb-4">
                                    Sistema completamente funcional
                                </h2>
                                <p className="text-muted">
                                    Backend con Laravel 12, Frontend con React 19 y TypeScript, 
                                    base de datos MySQL, Redis para cache, todo dockerizado y listo para producción.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
