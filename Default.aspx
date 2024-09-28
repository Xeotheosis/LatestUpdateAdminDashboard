<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppNet472.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AsPropManager - Home</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.3.0/css/all.css" />
    <link rel="icon" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" />
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css" />

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/react@17/umd/react.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
    <script src="https://unpkg.com/react-icons/umd/react-icons.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap');

        body{
            background-color: #000300;
        }

       

.SMN_effect-6 li:before {
	position: absolute;
	top: 0;
	left: 0;
	overflow: hidden;
	padding: 10px 0px;
	max-width: 0;
	border-bottom: 2px solid #9D4edd;
	color: #9D4edd;
	content: attr(data-hover);
	-webkit-transition: max-width 0.5s;
	-moz-transition: max-width 0.5s;
	transition: max-width 0.5s;
}

.SMN_effect-6 li:hover:before, .SMN_effect-6 li:focus:before {
	max-width: 100%;
}

        @keyframes appear {
            from {
                opacity:0;
                transform:translateX(100px);
            }
            to {
                opacity:1;
                 transform:translateX(0px);
            }
        }

        .appear-in-view {
            animation: appear 2s linear;
            animation-timeline: view();
            animation-range:entry 0% cover 40%;
        }

        .typewriter-container {
            display:inline-block;
        }

        .typewriter-text{
            border-right:5px solid;
            width:100%;
            white-space:nowrap;
            overflow:hidden;
            animation: typing 2s steps(18),cursor .4s step-end infinite alternate;


        }

        @keyframes cursor {
            50% {
                border-color:transparent;
            }
        }

        @keyframes typing {
            from {
                width:0
            }
        }

    </style>
</head>
    
<body>
    <div id="root" className="w-full h-full"></div>
    <script type="text/babel">
        const { useState } = React;
        
    

        const Default = () => {
            const [nav, setNav] = useState(false);

            const handleNav = () => {
                setNav(!nav);
            };

            return (
        <>
                <div className="text-white flex justify-between items-center h-24 max-w-[1240px] mx-auto px-4">
                    <h1 className="text-4xl font-bold text-white">AsPropManager</h1>
                    <div className="flex items-center gap-4">
                        <ul className="hidden md:flex SMN_effect-6 gap-4">
                            <li className="py-[10px] relative cursor-pointer" data-hover="Acasa">Acasa</li>
                            <li className="py-[10px] relative cursor-pointer" data-hover="Detalii">Detalii</li>
                            <li className="py-[10px] relative cursor-pointer" data-hover="Abonament">Abonament</li>
                            <li className="py-[10px] relative cursor-pointer" data-hover="Contact">Contact</li>
                        </ul>
                        <a href="Login.aspx" className="hidden md:block p-4 w-48 bg-[#9D4edd] rounded-md font-medium text-center max-h-18 hover:cursor-pointer hover:scale-95 transition-all delay-75">
                            Login
                        </a>
                    </div>

                    <div onClick={handleNav} className="block md:hidden">
                       
                    </div>
                    <div
                        className={
                            nav
                            ? "fixed left-0 top-0 w-[60%] border-r border-r-gray-900 h-full bg-[#000300]"
                            : "hidden left-[-100% ease-in-out duration-500]"
                        }
                    >
                        <h1 className="w-full text-3xl font-bold text-indigo-400 m-4">
                            AsPropManager
                        </h1>
                        <ul className="uppercase p-4">
                            <li className="p-4 border-b border-gray-600">Acasa</li>
                            <li className="p-4 border-b border-gray-600">Despre</li>
                            <li className="p-4 border-b border-gray-600">Abonament</li>
                            <li className="p-4 border-b border-gray-600">Contact</li>
                            <li className="p-4">Contact</li>
                        </ul>
                    </div>
                </div>
        <div className="text-white">
      <div className="max-w-[800px] mt-[-96px] w-full h-screen mx-auto text-center flex flex-col justify-center typewriter-container">
        <p className="text-[#9D4edd] font-bold p-2 uppercase">
          Solutie pentru asociatii
        </p>
        <h1 className="md:text-7xl sm:text-6xl text-4xl font-bold md:py-6 typewriter-text">
          Management Eficient
        </h1>
        <div>
          <p className="md:text-5xl sm:text-4xl text-xl font-bold py-4">
            Rapid, Flexibil, Simplu
          </p>
        </div>
        <p className="md:text-2xl  md:pl-4 text-xl font-bold text-gray-500">
          Gestioneaza datele oriunde ai fi
        </p>
        <div className="w-full flex justify-center py-4">
          <a className="p-4 w-48 bg-[#9D4edd] rounded-md font-medium text-center h-18 hover:cursor-pointer hover:scale-95 transition-all delay-75">
           Contact
          </a>
        </div>
      </div>
    </div>
         <div className="w-full bg-white py-16 px-4">
      <div className="max-w-[1240px] mx-auto grid md:grid-cols-2">
        <img
          className="w-[500px] mx-auto my-4 appear-in-view"
       src="\AdminAsoc\Images\laptop.jpg"
          alt="Laptop"
        />
        <div className="flex flex-col justify-center">
          <p className="text-[#9D4edd] font-bold uppercase appear-in-view">
            Dashboard pentru gestionarea datelor
          </p>
          <h1 className="md:text-4xl sm:text-3xl text-2xl font-bold py-2 capitalize appear-in-view">
            Facturi generate imediat
          </h1>
          <p className="test">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum
            molestiae delectus culpa hic assumenda, voluptate reprehenderit
            dolore autem cum ullam sed odit perspiciatis. Doloribus quos velit,
            eveniet ex deserunt fuga?
          </p>
          <a className="p-4 w-48 bg-[#9D4edd] rounded-md font-medium text-center max-h-18 hover:cursor-pointer my-4 text-white hover:scale-95 transition-all delay-75 hover:shadow-md">
            Login
          </a>
        </div>
      </div>
    </div>
          <div className="w-full py-16 text-white px-4">
      <div className="max-w-[1240px] mx-auto grid lg:grid-cols-3">
        <div className="lg:col-span-2 my-4 appear-in-view">
          <h1 className="md:text-4xl sm:text-3xl text-2xl font-bold py-2">
            Esti deja convins?
          </h1>
          <p>Lasa-ne adresa ta de email si te contactam noi</p>
        </div>
        <div className="my-4 appear-in-view">
          <div className="flex flex-col sm:flex-row items-center justify-between w-full">
            <input
              className="p-3 flex w-full rounded-md text-black"
              type="email"
              placeholder="Enter Email"
            />
            <button className="bg-[#9D4edd] text-white rounded-md font-medium w-[200px] ml-4 my-6 px-6 py-3 hover:scale-95 transition-all delay-75">
              Trimite
            </button>
          </div>
          <p>
            Datele tale sunt procesate conform{" "}
            <span className="text-[#9D4edd] hover:cursor-pointer">
              Politicii de confidentialitate
            </span>
          </p>
        </div>
      </div>
    </div>
        <div className="w-full py-[10rem] px-4 bg-white">
      <div className="max-w-[1240px] mx-auto grid md:grid-cols-3 gap-8">
        <div className="w-full shadow-xl flex flex-col p-4 my-4 rounded-lg hover:scale-105 duration-300 appear-in-view">
          <img
            className="w-20 mx-auto mt-[-3rem] bg-white"
            src="\AdminAsoc\Images\single.png"
            alt="/"
          />
          <h2 className="text-2xl font-bold text-center py-8">Single User</h2>
          <p className="text-center text-4xl font-bold">$1</p>
          <div className="text-center font-medium">
            <p className="py-2 border-b mx-8 mt-8">Gestionare singur</p>
            <p className="py-2 border-b mx-8">1 Utilizator</p>
            <p className="py-2 border-b mx-8">Pana la 30 de facturi</p>
          </div>
          <button className="bg-[#9D4edd] text-white w-[200px] rounded-md font-medium my-6 mx-auto px-6 py-3 hover:scale-95 transition-all delay-75">
            Alege
          </button>
        </div>
        <div className="w-full shadow-xl bg-gray-100 flex flex-col p-4 md:my-0 my-8 rounded-lg hover:scale-105 duration-300 appear-in-view">
          <img
            className="w-20 mx-auto mt-[-3rem] bg-transparent"
            src="\AdminAsoc\Images\double.png"
            alt="/"
          />
          <h2 className="text-2xl font-bold text-center py-8">Single User</h2>
          <p className="text-center text-4xl font-bold">$5</p>
          <div className="text-center font-medium">
            <p className="py-2 border-b mx-8 mt-8">Gestionare cu ajutor</p>
            <p className="py-2 border-b mx-8">1 Utilizator Admin</p>
            <p className="py-2 border-b mx-8">Facturi nelimitate</p>
          </div>
          <button className="bg-[#9D4edd] text-white w-[200px] rounded-md font-medium my-6 mx-auto px-6 py-3 hover:scale-95 transition-all delay-75">
            Alege
          </button>
        </div>
        <div className="w-full shadow-xl flex flex-col p-4 my-4 rounded-lg hover:scale-105 duration-300 appear-in-view
        ">
          <img
            className="w-20 mx-auto mt-[-3rem] bg-white"
            src="\AdminAsoc\Images\triple.png"
            alt="/"
          />
          <h2 className="text-2xl font-bold text-center py-8">Asociatie</h2>
          <p className="text-center text-4xl font-bold">$10</p>
          <div className="text-center font-medium">
            <p className="py-2 border-b mx-8 mt-8">Suport 24/7</p>
            <p className="py-2 border-b mx-8">3 Utilizatori Admini</p>
            <p className="py-2 border-b mx-8">Facturi nelimitate</p>
          </div>
          <button className="bg-[#9D4edd] text-white w-[200px] rounded-md font-medium my-6 mx-auto px-6 py-3 hover:scale-95 transition-all delay-75">
            Alege
          </button>
        </div>
      </div>
    </div>
         <div className="max-w-[1240px] mx-auto py-16 px-4 grid lg:grid-cols-3 gap-8 text-gray-300">
      <div>
        <h1 className="w-full text-3xl font-bold text-white">AsPropManager</h1>
        <p className="py-4">
          Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id odit
          ullam iste repellat consequatur libero reiciendis, blanditiis
          accusantium.
        </p>
        <div className="flex justify-between md:w-[75%] my-6">
       
        </div>
      </div>
      <div className="lg:col-span-2 flex justify-between mt-6">
        <div>
          <h6 className="font-medium text-gray-400">Solutii</h6>
          <ul>
            <li className="py-2 text-sm">Analiza</li>
            <li className="py-2 text-sm">Marketing</li>
            <li className="py-2 text-sm">Commerce</li>
            <li className="py-2 text-sm">Statistici</li>
          </ul>
        </div>
        <div>
          <h6 className="font-medium text-gray-400">Suport</h6>
          <ul>
            <li className="py-2 text-sm">Preturi</li>
            <li className="py-2 text-sm">Documentatie</li>
            <li className="py-2 text-sm">Ghid</li>
            <li className="py-2 text-sm">Status API</li>
          </ul>
        </div>
        <div>
          <h6 className="font-medium text-gray-400">Echipa</h6>
          <ul>
            <li className="py-2 text-sm">Despre</li>
            <li className="py-2 text-sm">Blog</li>
            <li className="py-2 text-sm">Joburi</li>
            <li className="py-2 text-sm">Articole</li>
          </ul>
        </div>
        <div>
          <h6 className="font-medium text-gray-400">Legal</h6>
          <ul>
            <li className="py-2 text-sm">Politici</li>
            <li className="py-2 text-sm">Garantie</li>
            <li className="py-2 text-sm">T & C</li>
          </ul>
        </div>
      </div>
    </div>
        </>
            );
        };

        ReactDOM.render(<Default />, document.getElementById('root'));
    </script>
</body>
</html>
