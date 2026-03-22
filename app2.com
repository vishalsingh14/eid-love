<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIG VR GROUP</title>
    <style>
        :root {
            --primary: #000000;
            --accent: #ff2e63;
            --soft-pink: #ffeef2;
        }

        body { margin: 0; font-family: 'Segoe UI', sans-serif; background: #1a1a1a; color: white; overflow: hidden; touch-action: manipulation; }
        .page { height: 100vh; width: 100vw; display: none; flex-direction: column; align-items: center; justify-content: center; text-align: center; position: absolute; top: 0; left: 0; }
        .active { display: flex; }

        /* --- PAGE 1: LOGO --- */
        #page1 { background: radial-gradient(circle, #222 0%, #000 100%); z-index: 10; }
        .logo { font-size: clamp(2.5rem, 8vw, 5rem); font-weight: 900; letter-spacing: 5px; margin-bottom: 30px; animation: glow 2s ease-in-out infinite alternate; }
        @keyframes glow {
            from { text-shadow: 0 0 10px #fff, 0 0 20px var(--accent); }
            to { text-shadow: 0 0 20px #fff, 0 0 40px var(--accent), 0 0 60px var(--accent); }
        }

        /* --- PAGE 2: GAME --- */
        #page2 { background: #f0f2f5; color: #333; z-index: 5; }
        .game-card { background: white; padding: 30px; border-radius: 25px; box-shadow: 0 15px 40px rgba(0,0,0,0.2); width: 85%; max-width: 350px; }
        .choices { display: flex; gap: 10px; justify-content: center; margin: 20px 0; }
        .choice-btn { font-size: 2.2rem; padding: 15px; border-radius: 15px; border: 2px solid #eee; background: white; cursor: pointer; flex: 1; transition: 0.2s; }
        .choice-btn:active { background: #ffeef2; transform: scale(0.95); }

        /* --- PAGE 3: LOVE --- */
        #page3 { background: var(--soft-pink); color: var(--accent); z-index: 1; }
        .main-heart { font-size: 7rem; animation: heartbeat 1.2s infinite; margin-bottom: 20px; }
        @keyframes heartbeat {
            0%, 30%, 60% { transform: scale(1); }
            15%, 45% { transform: scale(1.2); }
        }
        .falling-heart { position: absolute; top: -10%; color: var(--accent); opacity: 0.7; pointer-events: none; animation: fall linear forwards; }
        @keyframes fall { to { transform: translateY(110vh) rotate(360deg); } }

        /* Button Styling */
        .btn { padding: 18px 50px; font-size: 1.2rem; font-weight: bold; cursor: pointer; border: none; border-radius: 50px; background: var(--accent); color: white; transition: 0.3s; -webkit-tap-highlight-color: transparent; }
    </style>
</head>
<body>

    <div id="page1" class="page active">
        <div class="logo">BIG VR GROUP</div>
        <button class="btn" onclick="goToGame()">CONTINUE</button>
    </div>