(() => {
  const canvas = document.getElementById("galaxy-background");
  if (!canvas) {
    return;
  }

  const ctx = canvas.getContext("2d");
  if (!ctx) {
    return;
  }

  const config = {
    starSpeed: 0.5,
    density: 1,
    hueShift: 140,
    speed: 1,
    glowIntensity: 0.3,
    saturation: 0,
    mouseRepulsion: true,
    repulsionStrength: 2,
    twinkleIntensity: 0.3,
    rotationSpeed: 0.1,
    transparent: true,
  };

  let width = 0;
  let height = 0;
  let centerX = 0;
  let centerY = 0;
  let stars = [];
  let mouse = { x: 0, y: 0, active: false };
  let rotation = 0;

  const resize = () => {
    width = window.innerWidth;
    height = window.innerHeight;
    centerX = width / 2;
    centerY = height / 2;
    canvas.width = width;
    canvas.height = height;
    stars = createStars();
  };

  const createStars = () => {
    const baseCount = Math.max(120, Math.round((width * height) / 8000));
    const count = Math.round(baseCount * config.density);
    const generated = [];
    for (let i = 0; i < count; i += 1) {
      const angle = Math.random() * Math.PI * 2;
      const radius = Math.random() * Math.max(centerX, centerY);
      const x = centerX + Math.cos(angle) * radius;
      const y = centerY + Math.sin(angle) * radius;
      generated.push({
        x,
        y,
        angle,
        radius,
        size: Math.random() * 1.6 + 0.4,
        alpha: Math.random() * 0.6 + 0.2,
        twinkleOffset: Math.random() * Math.PI * 2,
      });
    }
    return generated;
  };

  const drawStars = (time) => {
    if (!config.transparent) {
      ctx.fillStyle = "#05060b";
      ctx.fillRect(0, 0, width, height);
    } else {
      ctx.clearRect(0, 0, width, height);
    }

    rotation += config.rotationSpeed * 0.0005;

    stars.forEach((star) => {
      const twinkle =
        1 +
        Math.sin(time * 0.002 + star.twinkleOffset) *
          config.twinkleIntensity;
      const alpha = Math.min(1, star.alpha * twinkle);

      const angle = star.angle + rotation;
      const driftX = Math.cos(angle) * star.radius;
      const driftY = Math.sin(angle) * star.radius;

      let x = centerX + driftX + config.starSpeed * 0.4;
      let y = centerY + driftY + config.speed * 0.4;

      if (config.mouseRepulsion && mouse.active) {
        const dx = x - mouse.x;
        const dy = y - mouse.y;
        const distance = Math.sqrt(dx * dx + dy * dy);
        if (distance < 160) {
          const force =
            ((160 - distance) / 160) * config.repulsionStrength * 12;
          x += (dx / distance) * force;
          y += (dy / distance) * force;
        }
      }

      ctx.beginPath();
      ctx.shadowBlur = star.size * 12 * config.glowIntensity;
      ctx.shadowColor = `hsla(${config.hueShift}, ${config.saturation}%, 80%, ${alpha})`;
      ctx.fillStyle = `hsla(${config.hueShift}, ${config.saturation}%, 90%, ${alpha})`;
      ctx.arc(x, y, star.size, 0, Math.PI * 2);
      ctx.fill();
    });
  };

  const animate = (time) => {
    drawStars(time);
    requestAnimationFrame(animate);
  };

  window.addEventListener("resize", resize);
  window.addEventListener("mousemove", (event) => {
    mouse = { x: event.clientX, y: event.clientY, active: true };
  });
  window.addEventListener("mouseleave", () => {
    mouse.active = false;
  });

  resize();
  requestAnimationFrame(animate);
})();
