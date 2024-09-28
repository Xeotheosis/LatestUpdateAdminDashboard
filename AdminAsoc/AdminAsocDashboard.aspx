<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="AdminAsocDashboard.aspx.cs" Inherits="WebAppNet472.AdminAsocDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/react@17/umd/react.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
    <style>
    :root {
        --main-colour-dark-blue: #0d1b2a; 
        --main-colour-blue: #1b263b;
        --main-colour-light-blue: #415a77;
        --main-colour-lightest-blue: #778da9;
        --secondary-colour-dark-puple: #3C096C;
        --secondary-colour-purple: #5A189A;
        --secondary-colour-light-purple: #7B2cbf;
        --secondary-colour-lightest-purple: #9D4edd;
    }

    @layer components {
        /* TYPOGRAPHY SETTINGS */
        .poppins {
            font-family: "Poppins", sans-serif;
        }
        .roboto {
            font-family: "Roboto", sans-serif;
        }

        /* BACKGROUND SETTINGS */
        .bg_main_colour_dark_blue {
            background-color: var(--main-colour-dark-blue);
        }
        .bg_main_colour_blue {
            background-color: var(--main-colour-blue);
        }
        .bg_main_colour_light_blue {
            background-color: var(--main-colour-light-blue);
        }
        .bg_main_colour_lightest_blue {
            background-color: var(--main-colour-lightest-blue);
        }
        .bg_secondary_colour_lightest_purple {
            background-color: var(--secondary-colour-lightest-purple);
        }

        .bg-glass {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding-block: 1rem;
            padding-inline: 1.25rem;
        }

        .menu_container_grid {}

        .menu_item {
            background-color: var(--main-colour-blue);
            transition: all 0.2s ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
            justify-content: center;
            gap: 1rem;
            border-radius: 0.375rem;
        }

        .menu_item:hover {
            box-shadow: 0 4px 6px -1px rgba(157, 78, 221, 0.5), 0 2px 4px -2px rgba(157, 78, 221, 0.5);
            transform: scale(0.95);
            cursor: pointer;
        }

        @media screen and (min-width: 624px) {
            .menu_item {
                padding: 1rem;
            }
        }

        @media screen and (max-height: 650px) {
            #main-container {
                transform: scale(0.85);
                transform-origin: top;
            }
            header {
                transform: scale(0.95);
                transform-origin: top;
            }
        }
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <section id="root"></section>
    <script type="text/babel">

const MainMenu = () => {
  return (
    <div id="main-container" className="grid grid-cols-1 md:grid-cols-2 gap-4 h-screen w-full text-white lg:p-4 text-sm">
      <div className="grid grid-cols-2 grid-rows-5 gap-4">
        <div className="menu_item items-center relative group col-span-2">
          <div className="bg-glass translate-y-0 transition-all delay-100 group-hover:opacity-0 group-hover:-translate-y-8 group-hover:delay-50">
            <i className="fa-solid fa-faucet"></i>
          </div>
          <div className="group-hover:opacity-0">
            Apa
          </div>
          <div className="absolute top-0 left-0 w-full h-full grid grid-cols-3">
            <a
href="\InfoScar\ApaCalda.aspx?idAsoc=35"
className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-100 hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
      <i className="fa-solid fa-faucet text-base bg-glass"></i>
      Apa calda
    </a>
           
            <a
        href="/InfoScari/ApaRece.aspx?idAsoc=35"
        
        className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-100 hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
              <i className="fa-solid fa-faucet text-base bg-glass"></i>
              Apa rece
            </a>
            <a 
        href="\AdminAsoc\InfoScari\ApaPluviala.aspx?idAsoc=35"
       
        className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-150 hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
              <i className="fa-solid fa-faucet text-base bg-glass"></i>
              Apa pluviala
            </a>
          </div>
        </div>
        <div className="menu_item relative group col-span-2">
          <div className="bg-glass translate-y-0 transition-all delay-100 group-hover:opacity-0 group-hover:-translate-y-8 group-hover:delay-50 group-hover:bg-[#1b263b]">
            <i className="fa-solid fa-faucet text-base"></i>
          </div>
          <div className="group-hover:opacity-0">
            <p className="text-sm">Energie</p>
          </div>
          <div className="absolute top-0 left-0 w-full h-full grid grid-cols-2">
            <a
        href="\AdminAsoc\InfoScari\CurentCasaScarii.aspx?idAsoc=35"className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-50 hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
              <i className="fa-solid fa-faucet bg-glass"></i>
              Energie scara
            </a>
            <a href="\AdminAsoc\InfoScari\CurentLift.aspx?idAsoc=35" className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-100 hover:cursor-pointer  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
              <i className="fa-solid fa-faucet bg-glass"></i>
              Energie lift
            </a>
          </div>
        </div>
        <div className="menu_item relative group">
   <div className="bg-glass translate-y-0 transition-all delay-100 group-hover:opacity-0 group-hover:-translate-y-8 group-hover:delay-50 group-hover:bg-[#1b263b]">
     <i className="fa-solid fa-faucet text-base"></i>
   </div>
   <div className="group-hover:opacity-0">
     <p className="text-sm">Facturi</p>
   </div>
   <div className="absolute top-0 left-0 w-full h-full grid grid-cols-2">
     <a
 href="\AdminAsoc\InfoScari\AltaFacturaCPI.aspx?idAsoc=35"className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-50 hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
       <i className="fa-solid fa-faucet bg-glass"></i>
       Facturi CPI
     </a>
     <a href="\AdminAsoc\InfoScari\AltaFacturaPersoane.aspx?idAsoc=35" className="flex flex-col justify-around items-center translate-y-8 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all delay-100 hover:cursor-pointer  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
       <i className="fa-solid fa-faucet bg-glass"></i>
      Facturi Persoane
     </a>
   </div>
 </div>
        <div className="menu_item  hover:cursor-pointer  hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-hand-holding-dollar bg-glass"></i>
          Preturi
        </div>
        <div className="menu_item  hover:cursor-pointer hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-highlighter bg-glass"></i>Editare
        </div>
        <a href="\AdminAsoc\InfoScari\Cheltuieli.aspx?idAsoc=35"className="menu_item  hover:cursor-pointer hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-sack-dollar bg-glass"></i>
          Cheltuieli
        </a>

        <a 
        href="\AdminAsoc\InfoScari\Gaze.aspx?idAsoc=35"
        className="menu_item transition-all  hover:cursor-pointer hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-fire-burner bg-glass"></i>
          <h2 className="text-sm">Gaze</h2>
        </a>
        <a 
        href="\AdminAsoc\InfoScari\ServiceLift.aspx?idAsoc=35"
        className="menu_item transition-all  hover:cursor-pointer hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-cable-car bg-glass"></i>
          <h2>Service Lift</h2>
        </a>
      </div>

      {/* SECOND COLUMN */}

      <div className="grid grid-cols-2 grid-rows-5 gap-4">
        <a href="\AdminAsoc\InfoScari\Restante.aspx?idAsoc=35"className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-hourglass-half bg-glass"></i>
          <h2>Restante</h2>
        </a>
        <a href="\AdminAsoc\InfoScari\CalduraApartamente.aspx?idAsoc=35"className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-fire bg-glass"></i>
          Caldura
        </a>

        <div className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-chalkboard-user bg-glass"></i>
          <h2>Afise</h2>
        </div>
        <div className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-clipboard-list bg-glass"></i>
          <h2>Centralizator</h2>
        </div>

        <div className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-regular fa-rectangle-list bg-glass"></i>
          <h2>Formulare</h2>
        </div>
        <div className="menu_item transition-all  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-chart-simple text-white bg-glass"></i>
          <h2>Consumuri</h2>
        </div>
        <div className="menu_item transition-all col-span-2  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="fa-solid fa-image bg-glass"></i>
          <h2>Altele</h2>
        </div>
        <div className="menu_item transition-all col-span-2  hover:cursor-pointer hover:transform hover:scale-110 hover:text-purple-600 hover:font-bold">
          <i className="bx bxs-cog bg-glass"></i>
          Setari
        </div>
      </div>
    </div>
  );
};

ReactDOM.render(<MainMenu />, document.getElementById('root'));
    </script>
</asp:Content>
